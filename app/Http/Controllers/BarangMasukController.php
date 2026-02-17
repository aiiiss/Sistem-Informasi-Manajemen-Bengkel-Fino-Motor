<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;
use App\Models\Barang;
use App\Models\Transaksi;
use App\Models\DetailTransaksi;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class BarangMasukController extends Controller
{
    public function index(Request $request): View
    {
        $search = $request->query('search');
        $query = Barang::query()->where('is_active', 1);

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('nama_barang', 'like', '%' . $search . '%')
                  ->orWhere('kode_barang', 'like', '%' . $search . '%');
            });
        }
        
        $semua_barang = $query->orderBy('nama_barang')->paginate(10);
        $cart = $request->session()->get('purchase_cart', []);

        $total_pembelian = 0;
        foreach ($cart as $id => $details) {
            $total_pembelian += $details['harga_beli'] * $details['quantity'];
        }

        return view('barang-masuk.index', compact('semua_barang', 'cart', 'total_pembelian'));
    }

    public function addToPurchaseCart(Request $request, Barang $barang): RedirectResponse
    {
        $quantity_to_add = (int) $request->input('quantity', 1);
        if ($quantity_to_add <= 0) {
            return redirect()->route('barang-masuk.index')->with('error', 'Jumlah harus minimal 1.');
        }

        $cart = $request->session()->get('purchase_cart', []);

        if (isset($cart[$barang->id])) {
            $cart[$barang->id]['quantity'] += $quantity_to_add;
        } else {
            $cart[$barang->id] = [
                "nama_barang" => $barang->nama_barang,
                "quantity" => $quantity_to_add,
                "harga_beli" => $barang->harga_beli,
                "barang_id" => $barang->id
            ];
        }

        $request->session()->put('purchase_cart', $cart);
        return redirect()->route('barang-masuk.index');
    }

    public function removeFromPurchaseCart(Request $request, $barang_id): RedirectResponse
    {
        $cart = $request->session()->get('purchase_cart', []);
        if (isset($cart[$barang_id])) {
            unset($cart[$barang_id]);
        }
        $request->session()->put('purchase_cart', $cart);
        return redirect()->route('barang-masuk.index');
    }

    /**
     * Menyimpan pembelian dengan KODE OTOMATIS (BELI-XXXXX).
     */
    public function store(Request $request): RedirectResponse
    {
        $cart = $request->session()->get('purchase_cart', []);
        if (empty($cart)) {
            return redirect()->route('barang-masuk.index')->with('error', 'Keranjang pembelian kosong.');
        }

        $total_pembelian = 0;
        foreach ($cart as $id => $details) {
            $total_pembelian += $details['harga_beli'] * $details['quantity'];
        }

        try {
            DB::beginTransaction();

            // --- MULAI LOGIKA KODE OTOMATIS (BELI-00001) ---
            
            $lastTrx = Transaksi::where('tipe_transaksi', 'masuk')
                                ->where('kode_transaksi', 'like', 'BELI-%')
                                ->orderBy('id', 'desc')
                                ->first();

            if (!$lastTrx) {
                $nomorUrut = 1;
            } else {
                $lastCode = $lastTrx->kode_transaksi;
                // Ambil angka dari index ke-5 (karena BELI- ada 5 karakter)
                $lastNumber = (int) substr($lastCode, 5); 
                $nomorUrut = $lastNumber + 1;
            }

            $kodeBaru = 'BELI-' . sprintf("%05d", $nomorUrut); 
            
            // --- SELESAI LOGIKA ---

            $transaksi = Transaksi::create([
                'kode_transaksi' => $kodeBaru, // Gunakan kode baru
                'tanggal_transaksi' => Carbon::now(),
                'tipe_transaksi' => 'masuk',
                'keterangan' => 'Pembelian Stok (Barang Masuk)',
                'total_nilai' => $total_pembelian,
                'users_id' => Auth::id(),
            ]);
            
            if (empty($transaksi->id)) {
                 throw new \Exception('Gagal membuat nota pembelian.');
            }

            foreach ($cart as $id => $details) {
                $barang = Barang::find($details['barang_id']);
                if (!$barang) {
                    throw new \Exception('Barang ' . $details['nama_barang'] . ' tidak ditemukan.');
                }

                DetailTransaksi::create([
                    'transaksi_id' => $transaksi->id,
                    'barang_id' => $details['barang_id'],
                    'nama_barang' => $details['nama_barang'],
                    'jumlah' => $details['quantity'],
                    'harga_satuan' => $details['harga_beli'],
                    'subtotal' => $details['harga_beli'] * $details['quantity'],
                ]);
            }

            DB::commit();
            $request->session()->forget('purchase_cart');
            return redirect()->route('barang-masuk.index')->with('success', 'Pembelian berhasil! No: ' . $kodeBaru);

        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->route('barang-masuk.index')->with('error', 'Gagal menyimpan pembelian: ' . $e->getMessage());
        }
    }
}