<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12 bg-gradient-to-br from-blue-50 via-white to-green-50 min-h-screen">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

            <!-- 1. KARTU RINGKASAN (GRID) -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">

                <!-- Kartu 1: Penjualan Hari Ini -->
                <div class="bg-white overflow-hidden shadow-soft sm:rounded-xl border border-blue-100 hover:shadow-soft-lg transition-all duration-300 transform hover:-translate-y-1">
                    <div class="p-6">
                        <div class="flex items-center justify-between mb-3">
                            <div class="p-3 rounded-xl bg-gradient-to-br from-primary-400 to-primary-500">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                            </div>
                        </div>
                        <h3 class="text-sm font-medium text-gray-500 uppercase tracking-wide">Penjualan Hari Ini</h3>
                        <p class="mt-2 text-3xl font-bold bg-gradient-to-r from-primary-600 to-primary-500 bg-clip-text text-transparent">
                            Rp {{ number_format($totalPenjualanHariIni, 0, ',', '.') }}
                        </p>
                    </div>
                </div>

                <!-- Kartu 2: Stok Kritis -->
                <div class="bg-white overflow-hidden shadow-soft sm:rounded-xl border border-orange-100 hover:shadow-soft-lg transition-all duration-300 transform hover:-translate-y-1">
                    <div class="p-6">
                        <div class="flex items-center justify-between mb-3">
                            <div class="p-3 rounded-xl bg-gradient-to-br from-orange-400 to-rose-400">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                                </svg>
                            </div>
                        </div>
                        <h3 class="text-sm font-medium text-gray-500 uppercase tracking-wide">Barang Stok Kritis</h3>
                        <p class="mt-2 text-3xl font-bold text-rose-600">
                            {{ $jumlahStokKritis }} 
                            <span class="text-lg font-medium text-gray-500">Barang</span>
                        </p>
                    </div>
                </div>

                <!-- Kartu 3: Transaksi Hari Ini -->
                <div class="bg-white overflow-hidden shadow-soft sm:rounded-xl border border-green-100 hover:shadow-soft-lg transition-all duration-300 transform hover:-translate-y-1">
                    <div class="p-6">
                        <div class="flex items-center justify-between mb-3">
                            <div class="p-3 rounded-xl bg-gradient-to-br from-emerald-400 to-green-500">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" />
                                </svg>
                            </div>
                        </div>
                        <h3 class="text-sm font-medium text-gray-500 uppercase tracking-wide">Transaksi Hari Ini</h3>
                        <p class="mt-2 text-3xl font-bold bg-gradient-to-r from-emerald-600 to-green-500 bg-clip-text text-transparent">
                            {{ $jumlahTransaksiHariIni }} 
                            <span class="text-lg font-medium text-gray-500">Transaksi</span>
                        </p>
                    </div>
                </div>
            </div>
            <!-- AKHIR KARTU RINGKASAN -->


            <!-- 2. GRID TABEL (2 KOLOM) -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">

                <!-- TABEL PERINGATAN STOK KRITIS -->
                <div class="bg-white overflow-hidden shadow-soft sm:rounded-xl border border-gray-100 h-full">
                    <div class="p-6 flex flex-col h-full">
                        <div class="flex justify-between items-center mb-5">
                            <h3 class="text-lg font-bold text-gray-800 flex items-center">
                                <div class="p-2 rounded-lg bg-rose-100 mr-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-rose-600" viewBox="0 0 20 20" fill="currentColor">
                                      <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
                                    </svg>
                                </div>
                                Peringatan Stok Menipis
                            </h3>
                            <a href="{{ route('laporan.index') }}" class="text-sm font-medium text-primary-600 hover:text-primary-700 flex items-center group">
                                Lihat Semua 
                                <svg class="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                                </svg>
                            </a>
                        </div>
                        
                        <div class="overflow-x-auto flex-grow">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gradient-to-r from-gray-50 to-blue-50">
                                    <tr>
                                        <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Barang</th>
                                        <th class="px-4 py-3 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">Min</th>
                                        <th class="px-4 py-3 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">Stok</th>
                                        <th class="px-4 py-3 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-100">
                                    @forelse ($stokKritis as $barang)
                                        <tr class="bg-gradient-to-r from-rose-50 to-orange-50 hover:from-rose-100 hover:to-orange-100 transition-colors">
                                            <td class="px-4 py-4 text-sm font-medium text-gray-900">
                                                {{ $barang->nama_barang }}
                                                <div class="text-xs text-gray-500 mt-1 flex items-center">
                                                    <span class="px-2 py-0.5 rounded-md bg-white/80 font-mono">{{ $barang->kode_barang }}</span>
                                                </div>
                                            </td>
                                            <td class="px-4 py-4 text-sm text-center text-gray-600 font-medium">{{ $barang->stok_minimum }}</td>
                                            <td class="px-4 py-4 text-sm text-center">
                                                <span class="px-3 py-1 rounded-full bg-rose-100 text-rose-700 font-bold">
                                                    {{ $barang->jumlah_stok }}
                                                </span>
                                            </td>
                                            <td class="px-4 py-4 text-center">
                                                <a href="{{ route('barang-masuk.index', ['search' => $barang->kode_barang]) }}" 
                                                   class="inline-flex items-center px-3 py-1.5 text-xs font-semibold rounded-lg text-white bg-gradient-to-r from-emerald-500 to-green-500 hover:from-emerald-600 hover:to-green-600 transition-all shadow-sm hover:shadow-md">
                                                    <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/>
                                                    </svg>
                                                    Restock
                                                </a>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="4" class="px-4 py-12 text-center">
                                                <div class="flex flex-col items-center">
                                                    <div class="p-3 rounded-full bg-gradient-to-br from-emerald-100 to-green-100 mb-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10 text-emerald-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                                                        </svg>
                                                    </div>
                                                    <p class="text-sm font-medium text-gray-600">Semua stok aman! 🎉</p>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- TABEL TRANSAKSI TERBARU -->
                <div class="bg-white overflow-hidden shadow-soft sm:rounded-xl border border-gray-100 h-full">
                    <div class="p-6 flex flex-col h-full">
                        <div class="flex justify-between items-center mb-5">
                            <h3 class="text-lg font-bold text-gray-800 flex items-center">
                                <div class="p-2 rounded-lg bg-blue-100 mr-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-primary-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
                                    </svg>
                                </div>
                                Aktivitas Transaksi Terbaru
                            </h3>
                        </div>
                        <div class="overflow-x-auto flex-grow">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gradient-to-r from-gray-50 to-blue-50">
                                    <tr>
                                        <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Kode</th>
                                        <th class="px-4 py-3 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">Tipe</th>
                                        <th class="px-4 py-3 text-right text-xs font-semibold text-gray-600 uppercase tracking-wider">Total</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-100">
                                    @forelse ($transaksiTerbaru as $trx)
                                        <tr class="hover:bg-blue-50/50 transition-colors">
                                            <td class="px-4 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                <div class="flex items-center">
                                                    <span class="px-2 py-1 rounded-md bg-gray-100 font-mono text-xs">
                                                        {{ $trx->kode_transaksi }}
                                                    </span>
                                                </div>
                                                <div class="text-xs text-gray-500 mt-2 flex items-center">
                                                    <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                                    </svg>
                                                    {{ $trx->created_at->diffForHumans() }}
                                                </div>
                                            </td>
                                            <td class="px-4 py-4 whitespace-nowrap text-sm text-center">
                                                @if ($trx->tipe_transaksi == 'keluar')
                                                    <span class="px-3 py-1.5 inline-flex items-center text-xs font-bold rounded-full bg-gradient-to-r from-rose-100 to-red-100 text-rose-700 shadow-sm">
                                                        <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"/>
                                                        </svg>
                                                        Jual
                                                    </span>
                                                @else
                                                    <span class="px-3 py-1.5 inline-flex items-center text-xs font-bold rounded-full bg-gradient-to-r from-emerald-100 to-green-100 text-emerald-700 shadow-sm">
                                                        <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 11l5-5m0 0l5 5m-5-5v12"/>
                                                        </svg>
                                                        Beli
                                                    </span>
                                                @endif
                                            </td>
                                            <td class="px-4 py-4 whitespace-nowrap text-sm text-right font-semibold text-gray-900">
                                                Rp {{ number_format($trx->total_nilai, 0, ',', '.') }}
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="3" class="px-4 py-12 text-center">
                                                <div class="flex flex-col items-center">
                                                    <div class="p-3 rounded-full bg-gradient-to-br from-gray-100 to-blue-100 mb-3">
                                                        <svg class="h-10 w-10 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                                                        </svg>
                                                    </div>
                                                    <p class="text-sm font-medium text-gray-600">Belum ada transaksi hari ini</p>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- AKHIR GRID TABEL -->

        </div>
    </div>
</x-app-layout>