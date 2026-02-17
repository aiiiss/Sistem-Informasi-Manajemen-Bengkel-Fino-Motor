<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\Kategori;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class BarangController extends Controller
{
    /**
     * Menampilkan daftar barang.
     */
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

        $semua_barang = $query->paginate(15);
        return view('barang.index', compact('semua_barang'));
    }

    public function create(): View
    {
        $semua_kategori = Kategori::where('is_active', 1)->orderBy('nama_kategori')->get();
        return view('barang.create', compact('semua_kategori'));
    }

    /**
     * Menyimpan barang baru dengan KODE OTOMATIS.
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'nama_barang' => 'required|string|max:255',
            'harga_beli' => 'required|numeric|min:0',
            'harga_jual' => 'required|numeric|min:0',
            'kategori_id' => 'required|integer|exists:kategori,id',
        ]);

        // --- MULAI LOGIKA KODE OTOMATIS (BRG-001) ---
        
        // 1. Cari barang terakhir yang kodenya diawali 'BRG-'
        $lastBarang = Barang::where('kode_barang', 'like', 'BRG-%')
                            ->orderBy('id', 'desc')
                            ->first();

        // 2. Tentukan nomor urut berikutnya
        if (!$lastBarang) {
            $nomorUrut = 1; // Jika belum ada, mulai dari 1
        } else {
            // Ambil angka dari kode terakhir (Hapus 'BRG-' yang panjangnya 4 char)
            // Contoh: BRG-005 -> ambil "005" -> jadi integer 5
            $lastCode = $lastBarang->kode_barang;
            $lastNumber = (int) substr($lastCode, 4); 
            $nomorUrut = $lastNumber + 1;
        }

        // 3. Format menjadi 3 digit (001, 002, 010, 100)
        $kodeBarangBaru = 'BRG-' . sprintf("%03d", $nomorUrut);

        // --- SELESAI LOGIKA KODE OTOMATIS ---

        Barang::create([
            'nama_barang' => $request->nama_barang,
            'harga_beli' => $request->harga_beli,
            'harga_jual' => $request->harga_jual,
            'kategori_id' => $request->kategori_id,
            'jumlah_stok' => 0, // Stok awal selalu 0 (Sesuai SOP)
            'users_id' => Auth::id(), 
            'stok_minimum' => 5, 
            'tipe_stok' => 'pcs',
            'kode_barang' => $kodeBarangBaru, // <-- Gunakan kode otomatis
        ]);

        return redirect()->route('barang.index')->with('status', 'Barang baru berhasil ditambahkan: ' . $kodeBarangBaru);
    }

    public function show(Barang $barang)
    {
        return redirect()->route('barang.edit', $barang);
    }

    public function edit(Barang $barang): View
    {
        $semua_kategori = Kategori::where('is_active', 1)->orderBy('nama_kategori')->get();
        return view('barang.edit', compact('barang', 'semua_kategori'));
    }

    public function update(Request $request, Barang $barang): RedirectResponse
    {
        $request->validate([
            'nama_barang' => 'required|string|max:255',
            'harga_beli' => 'required|numeric|min:0',
            'harga_jual' => 'required|numeric|min:0',
            'kategori_id' => 'required|integer|exists:kategori,id',
        ]);

        $barang->update([
            'nama_barang' => $request->nama_barang,
            'harga_beli' => $request->harga_beli,
            'harga_jual' => $request->harga_jual,
            'kategori_id' => $request->kategori_id,
            'users_id' => Auth::id(),
        ]);

        return redirect()->route('barang.index')->with('status', 'Data barang berhasil diperbarui!');
    }

    public function destroy(Barang $barang): RedirectResponse
    {
        if ($barang->jumlah_stok > 0) {
            return redirect()->route('barang.index')
                ->with('error', 'Gagal! Tidak dapat menonaktifkan barang yang masih memiliki stok.');
        }

        $barang->is_active = 0; 
        $barang->save();

        return redirect()->route('barang.index')->with('status', 'Barang berhasil di-nonaktifkan (diarsipkan).');
    }
}