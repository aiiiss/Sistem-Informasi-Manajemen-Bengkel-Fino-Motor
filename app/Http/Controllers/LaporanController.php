<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;
use App\Models\Barang;
use App\Models\Transaksi;
use Carbon\Carbon;
use App\Exports\LaporanExport;
use Maatwebsite\Excel\Facades\Excel;

class LaporanController extends Controller
{
    /**
     * Menampilkan halaman laporan dengan filter dan ringkasan keuangan.
     */
    public function index(Request $request): View
    {
        // 1. Tentukan Rentang Tanggal
        $startDate = $request->input('start_date', Carbon::now()->startOfMonth()->format('Y-m-d'));
        $endDate = $request->input('end_date', Carbon::now()->endOfMonth()->format('Y-m-d'));

        // 2. Query Dasar Transaksi
        $queryTransaksi = Transaksi::whereDate('tanggal_transaksi', '>=', $startDate)
                                   ->whereDate('tanggal_transaksi', '<=', $endDate);

        // Hitung Pemasukan, Pengeluaran, Profit
        $totalPemasukan = (clone $queryTransaksi)->where('tipe_transaksi', 'keluar')->sum('total_nilai');
        $totalPengeluaran = (clone $queryTransaksi)->where('tipe_transaksi', 'masuk')->sum('total_nilai');
        $keuntungan = $totalPemasukan - $totalPengeluaran;

        // Ambil Data Riwayat untuk Tabel
        // PERBAIKAN: Menggunakan 'details' sesuai yang ada di LaporanExport.php
        $riwayat_transaksi = $queryTransaksi->with(['user', 'details']) 
            ->latest('tanggal_transaksi')
            ->paginate(20)
            ->withQueryString();

        // 3. Laporan Stok Kritis
        $laporan_stok_kritis = Barang::where('is_active', 1)
            ->whereColumn('jumlah_stok', '<=', 'stok_minimum')
            ->orderBy('jumlah_stok', 'asc')
            ->get();

        return view('laporan.index', compact(
            'laporan_stok_kritis', 
            'riwayat_transaksi',
            'totalPemasukan',
            'totalPengeluaran',
            'keuntungan',
            'startDate',
            'endDate'
        ));
    }

    public function export(Request $request)
    {
        $startDate = $request->input('start_date', Carbon::now()->startOfMonth()->format('Y-m-d'));
        $endDate = $request->input('end_date', Carbon::now()->endOfMonth()->format('Y-m-d'));

        $fileName = 'Laporan_Bengkel_' . $startDate . '_sd_' . $endDate . '.xlsx';

        return Excel::download(new LaporanExport($startDate, $endDate), $fileName);
    }
}