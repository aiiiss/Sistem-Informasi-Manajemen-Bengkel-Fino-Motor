<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;
use App\Models\Transaksi;
use App\Models\Barang;
use Carbon\Carbon;

class DashboardController extends Controller
{
    /**
     * Menampilkan halaman utama Dashboard.
     */
    public function index(): View
    {
        // Tentukan tanggal hari ini
        $hariIni = Carbon::today();

        // 1. Ambil Total Penjualan Hari Ini
        $totalPenjualanHariIni = Transaksi::where('tipe_transaksi', 'keluar')
            ->whereDate('tanggal_transaksi', $hariIni)
            ->sum('total_nilai');

        // 2. Ambil Data Stok Kritis (PERUBAHAN DI SINI)
        // Kita ambil datanya (get), bukan cuma jumlahnya (count)
        // Kita batasi 5 item teratas agar dashboard tidak terlalu penuh
        $stokKritis = Barang::where('is_active', 1)
            ->whereColumn('jumlah_stok', '<=', 'stok_minimum')
            ->orderBy('jumlah_stok', 'asc')
            ->take(5) // Ambil 5 barang paling kritis
            ->get();
            
        // Hitung jumlah totalnya juga untuk ditampilkan di kartu ringkasan
        $jumlahStokKritis = Barang::where('is_active', 1)
            ->whereColumn('jumlah_stok', '<=', 'stok_minimum')
            ->count();

        // 3. Ambil Jumlah Transaksi Hari Ini (Penjualan + Pembelian)
        $jumlahTransaksiHariIni = Transaksi::whereDate('tanggal_transaksi', $hariIni)
            ->count();
            
        // 4. Ambil 5 Transaksi Terbaru (Penjualan & Pembelian)
        $transaksiTerbaru = Transaksi::with('user')
            ->latest() 
            ->take(5) 
            ->get();

        // 5. Kirim semua data ke view
        return view('dashboard', compact(
            'totalPenjualanHariIni',
            'stokKritis',       // Data barang kritis (untuk tabel)
            'jumlahStokKritis', // Jumlah total (untuk kartu ringkasan)
            'jumlahTransaksiHariIni',
            'transaksiTerbaru'
        ));
    }
}