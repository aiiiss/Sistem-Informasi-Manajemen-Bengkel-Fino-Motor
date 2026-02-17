<?php

namespace App\Http\Controllers;

use App\Models\Kategori;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;

class KategoriController extends Controller
{
    /**
     * Menampilkan daftar kategori dengan Pencarian & Jumlah Barang.
     */
    public function index(Request $request): View
    {
        $search = $request->query('search');
        
        $query = Kategori::where('is_active', 1);

        if ($search) {
            $query->where('nama_kategori', 'like', '%' . $search . '%');
        }

        $kategoris = $query->withCount(['barangs' => function ($q) {
            $q->where('is_active', 1);
        }])
        ->orderBy('nama_kategori')
        ->paginate(10);

        return view('kategori.index', compact('kategoris'));
    }

    /**
     * Menampilkan detail kategori dan daftar barang di dalamnya.
     * (INI ADALAH FUNGSI BARU UNTUK MENAMPILKAN ISI KATEGORI)
     */
    public function show(Kategori $kategori): View
    {
        // Ambil barang-barang yang aktif dalam kategori ini
        $barangs = $kategori->barangs()
                            ->where('is_active', 1)
                            ->orderBy('nama_barang')
                            ->paginate(15); // Paginasi 15 barang per halaman

        return view('kategori.show', compact('kategori', 'barangs'));
    }

    public function create(): View
    {
        return view('kategori.create');
    }

    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'nama_kategori' => 'required|string|max:100|unique:kategori,nama_kategori',
            'catatan' => 'nullable|string',
        ]);

        Kategori::create([
            'nama_kategori' => $request->nama_kategori,
            'catatan' => $request->catatan,
            'is_active' => 1,
        ]);

        return redirect()->route('kategori.index')->with('success', 'Kategori berhasil ditambahkan!');
    }

    public function edit(Kategori $kategori): View
    {
        return view('kategori.edit', compact('kategori'));
    }

    public function update(Request $request, Kategori $kategori): RedirectResponse
    {
        $request->validate([
            'nama_kategori' => 'required|string|max:100|unique:kategori,nama_kategori,' . $kategori->id,
            'catatan' => 'nullable|string',
        ]);

        $kategori->update([
            'nama_kategori' => $request->nama_kategori,
            'catatan' => $request->catatan,
        ]);

        return redirect()->route('kategori.index')->with('success', 'Kategori berhasil diperbarui!');
    }

    public function destroy(Kategori $kategori): RedirectResponse
    {
        if ($kategori->barangs()->where('is_active', 1)->count() > 0) {
            return redirect()->route('kategori.index')
                ->with('error', 'Gagal! Kategori ini masih digunakan oleh Barang yang aktif.');
        }

        $kategori->update(['is_active' => 0]);

        return redirect()->route('kategori.index')->with('success', 'Kategori berhasil dihapus.');
    }
}