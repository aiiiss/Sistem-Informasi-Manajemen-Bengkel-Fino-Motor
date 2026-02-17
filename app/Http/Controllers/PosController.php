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

class PosController extends Controller
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
        
        $barangs = $query->orderBy('nama_barang')->paginate(10);
        $cart = $request->session()->get('cart', []);
        
        // Hitung total hanya dari barang dulu
        $totalHarga = 0;
        foreach ($cart as $id => $details) {
            $totalHarga += $details['harga_jual'] * $details['quantity'];
        }

        return view('pos.index', compact('barangs', 'cart', 'totalHarga'));
    }

    public function addToCart(Request $request, Barang $barang): RedirectResponse
    {
        $quantityToAdd = (int) $request->input('quantity', 1);
        if ($quantityToAdd < 1) return redirect()->route('pos.index')->with('error', 'Jumlah minimal 1.');

        $cart = $request->session()->get('cart', []);

        if ($barang->jumlah_stok <= 0) return redirect()->route('pos.index')->with('error', 'Stok habis!');
        
        $currentQty = isset($cart[$barang->id]) ? $cart[$barang->id]['quantity'] : 0;
        if ($currentQty + $quantityToAdd > $barang->jumlah_stok) {
            return redirect()->route('pos.index')->with('error', 'Stok tidak cukup!');
        }

        if (isset($cart[$barang->id])) {
            $cart[$barang->id]['quantity'] += $quantityToAdd;
        } else {
            $cart[$barang->id] = [
                "nama_barang" => $barang->nama_barang,
                "quantity" => $quantityToAdd,
                "harga_jual" => $barang->harga_jual,
                "barang_id" => $barang->id,
                "id" => $barang->id 
            ];
        }

        $request->session()->put('cart', $cart);
        return redirect()->route('pos.index');
    }

    public function removeFromCart(Request $request, $barang_id): RedirectResponse
    {
        $cart = $request->session()->get('cart', []);
        if (isset($cart[$barang_id])) unset($cart[$barang_id]);
        $request->session()->put('cart', $cart);
        return redirect()->route('pos.index');
    }

    public function store(Request $request): RedirectResponse
    {
        $cart = $request->session()->get('cart', []);
        
        // 1. Ambil Data Jasa & Mekanik dari Input
        $mekanik = $request->input('mekanik');
        $biayaJasa = (float) $request->input('biaya_jasa', 0);

        if (empty($mekanik)) {
            $biayaJasa = 0; 
        }

        if (empty($cart) && $biayaJasa <= 0) {
            return redirect()->route('pos.index')->with('error', 'Keranjang kosong dan tidak ada jasa servis.');
        }

        // 2. Hitung Total Barang
        $totalBarang = collect($cart)->sum(function ($item) {
            return $item['harga_jual'] * $item['quantity'];
        });

        // 3. Hitung Grand Total (Barang + Jasa)
        $grandTotal = $totalBarang + $biayaJasa;

        try {
            DB::beginTransaction();

            // Generate Kode INV-XXXXX
            $lastTrx = Transaksi::where('tipe_transaksi', 'keluar')->where('kode_transaksi', 'like', 'INV-%')->latest('id')->first();
            $nomorUrut = $lastTrx ? ((int) substr($lastTrx->kode_transaksi, 4)) + 1 : 1;
            $kodeBaru = 'INV-' . sprintf("%05d", $nomorUrut); 

            $transaksi = Transaksi::create([
                'kode_transaksi' => $kodeBaru,
                'tanggal_transaksi' => Carbon::now(),
                'tipe_transaksi' => 'keluar',
                'keterangan' => 'Penjualan POS',
                'total_nilai' => $grandTotal,
                'users_id' => Auth::id(),
                'mekanik' => $mekanik,        
                'biaya_jasa' => $biayaJasa    
            ]);
            
            if (!empty($cart)) {
                foreach ($cart as $item) {
                    $barangId = $item['barang_id'] ?? $item['id'];
                    $barang = Barang::find($barangId);
                    
                    if (!$barang || $barang->jumlah_stok < $item['quantity']) {
                        throw new \Exception('Stok ' . $item['nama_barang'] . ' kurang.');
                    }

                    DetailTransaksi::create([
                        'transaksi_id' => $transaksi->id,
                        'barang_id' => $barangId,
                        'nama_barang' => $item['nama_barang'],
                        'jumlah' => $item['quantity'],
                        'harga_satuan' => $item['harga_jual'],
                        'subtotal' => $item['harga_jual'] * $item['quantity'],
                    ]);
                }
            }

            DB::commit();
            $request->session()->forget('cart');

            return redirect()->route('pos.invoice', ['transaksi' => $transaksi->id])
                             ->with('success', 'Transaksi Berhasil! Total: Rp ' . number_format($grandTotal));

        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->route('pos.index')->with('error', 'Gagal: ' . $e->getMessage());
        }
    }

    // --- PERBAIKAN ADA DI SINI ---
    public function printInvoice(Transaksi $transaksi)
    {
        $detailTransaksi = DetailTransaksi::where('transaksi_id', $transaksi->id)->get();
        
        // Kita definisikan kembali variabel $totalHarga agar view tidak error
        $totalHarga = $transaksi->total_nilai; 

        return view('pos.invoice', compact('transaksi', 'detailTransaksi', 'totalHarga'));
    }
}