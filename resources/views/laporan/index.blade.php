<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Laporan & Pembukuan') }}
        </h2>
    </x-slot>

    <div class="py-12 bg-gradient-to-br from-blue-50 via-white to-green-50 min-h-screen">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            
            <!-- 1. FORM FILTER TANGGAL -->
            <div class="bg-white overflow-hidden shadow-soft-lg sm:rounded-xl border border-gray-100 mb-6">
                <div class="p-6">
                    <div class="flex items-center mb-4">
                        <div class="p-3 rounded-xl bg-gradient-to-br from-primary-400 to-primary-500 mr-4">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.293A1 1 0 013 6.586V4z"/>
                            </svg>
                        </div>
                        <div>
                            <h3 class="text-lg font-bold text-gray-800">Filter Periode</h3>
                            <p class="text-sm text-gray-600">Pilih rentang tanggal untuk laporan</p>
                        </div>
                    </div>

                    <form action="{{ route('laporan.index') }}" method="GET" class="flex flex-col md:flex-row gap-4 items-end">
                        <div class="flex-1">
                            <label for="start_date" class="block text-sm font-semibold text-gray-700 mb-2">Dari Tanggal</label>
                            <input type="date" name="start_date" value="{{ $startDate }}" 
                                   class="block w-full rounded-lg shadow-sm border-gray-300 focus:border-primary-400 focus:ring focus:ring-primary-200 focus:ring-opacity-50">
                        </div>
                        <div class="flex-1">
                            <label for="end_date" class="block text-sm font-semibold text-gray-700 mb-2">Sampai Tanggal</label>
                            <input type="date" name="end_date" value="{{ $endDate }}" 
                                   class="block w-full rounded-lg shadow-sm border-gray-300 focus:border-primary-400 focus:ring focus:ring-primary-200 focus:ring-opacity-50">
                        </div>
                        <div class="flex gap-2 flex-wrap">
                            <button type="submit" class="px-5 py-2.5 bg-gradient-to-r from-primary-500 to-primary-600 text-white rounded-lg hover:from-primary-600 hover:to-primary-700 transition-all shadow-md hover:shadow-lg font-medium">
                                <div class="flex items-center">
                                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.293A1 1 0 013 6.586V4z"/>
                                    </svg>
                                    Filter
                                </div>
                            </button>
                            <a href="{{ route('laporan.index') }}" class="px-5 py-2.5 bg-gradient-to-r from-gray-500 to-gray-600 text-white rounded-lg hover:from-gray-600 hover:to-gray-700 transition-all shadow-md hover:shadow-lg font-medium">
                                <div class="flex items-center">
                                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                                    </svg>
                                    Reset
                                </div>
                            </a>
                            <a href="{{ route('laporan.export', ['start_date' => $startDate, 'end_date' => $endDate]) }}" 
                               class="px-5 py-2.5 bg-gradient-to-r from-emerald-500 to-green-500 text-white rounded-lg hover:from-emerald-600 hover:to-green-600 transition-all shadow-md hover:shadow-lg font-medium">
                                <div class="flex items-center">
                                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/>
                                    </svg>
                                    Export Excel
                                </div>
                            </a>
                        </div>
                    </form>
                </div>
            </div>

            <!-- 2. KARTU RINGKASAN KEUANGAN -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
                <!-- Pemasukan -->
                <div class="bg-white overflow-hidden shadow-soft sm:rounded-xl border border-green-100 hover:shadow-soft-lg transition-all duration-300 transform hover:-translate-y-1">
                    <div class="p-6">
                        <div class="flex items-center justify-between mb-3">
                            <div class="p-3 rounded-xl bg-gradient-to-br from-emerald-400 to-green-500">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 11l5-5m0 0l5 5m-5-5v12"/>
                                </svg>
                            </div>
                        </div>
                        <div class="text-sm font-medium text-gray-500 uppercase tracking-wide">Total Pemasukan</div>
                        <div class="mt-2 text-3xl font-bold bg-gradient-to-r from-emerald-600 to-green-500 bg-clip-text text-transparent">
                            Rp {{ number_format($totalPemasukan, 0, ',', '.') }}
                        </div>
                    </div>
                </div>

                <!-- Pengeluaran -->
                <div class="bg-white overflow-hidden shadow-soft sm:rounded-xl border border-rose-100 hover:shadow-soft-lg transition-all duration-300 transform hover:-translate-y-1">
                    <div class="p-6">
                        <div class="flex items-center justify-between mb-3">
                            <div class="p-3 rounded-xl bg-gradient-to-br from-rose-400 to-red-500">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 13l-5 5m0 0l-5-5m5 5V6"/>
                                </svg>
                            </div>
                        </div>
                        <div class="text-sm font-medium text-gray-500 uppercase tracking-wide">Total Pengeluaran</div>
                        <div class="mt-2 text-3xl font-bold text-rose-600">
                            Rp {{ number_format($totalPengeluaran, 0, ',', '.') }}
                        </div>
                    </div>
                </div>

                <!-- Keuntungan -->
                <div class="bg-white overflow-hidden shadow-soft sm:rounded-xl border {{ $keuntungan >= 0 ? 'border-blue-100' : 'border-amber-100' }} hover:shadow-soft-lg transition-all duration-300 transform hover:-translate-y-1">
                    <div class="p-6">
                        <div class="flex items-center justify-between mb-3">
                            <div class="p-3 rounded-xl bg-gradient-to-br {{ $keuntungan >= 0 ? 'from-primary-400 to-blue-500' : 'from-amber-400 to-yellow-500' }}">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"/>
                                </svg>
                            </div>
                        </div>
                        <div class="text-sm font-medium text-gray-500 uppercase tracking-wide">Keuntungan Bersih</div>
                        <div class="mt-2 text-3xl font-bold {{ $keuntungan >= 0 ? 'bg-gradient-to-r from-primary-600 to-blue-500 bg-clip-text text-transparent' : 'text-amber-600' }}">
                            Rp {{ number_format($keuntungan, 0, ',', '.') }}
                        </div>
                    </div>
                </div>
            </div>

            <!-- 3. TABEL RIWAYAT TRANSAKSI -->
            <div class="bg-white overflow-hidden shadow-soft-lg sm:rounded-xl border border-gray-100 mb-6">
                <div class="p-6">
                    <div class="flex items-center mb-6">
                        <div class="p-3 rounded-xl bg-gradient-to-br from-indigo-400 to-purple-500 mr-4">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                            </svg>
                        </div>
                        <div>
                            <h3 class="text-lg font-bold text-gray-800">Riwayat Transaksi</h3>
                            <p class="text-sm text-gray-600">{{ date('d M Y', strtotime($startDate)) }} - {{ date('d M Y', strtotime($endDate)) }}</p>
                        </div>
                    </div>

                    <div class="overflow-x-auto rounded-lg border border-gray-200">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gradient-to-r from-gray-50 to-blue-50">
                                <tr>
                                    <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Kode</th>
                                    <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Tanggal</th>
                                    <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Tipe</th>
                                    <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Ringkasan Barang</th>
                                    <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Total</th>
                                    <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Jasa (Rp)</th>
                                    <th class="px-6 py-4 text-center text-xs font-semibold text-gray-700 uppercase tracking-wider">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-100">
                                @forelse ($riwayat_transaksi as $trx)
                                    <tr class="hover:bg-blue-50/50 transition-colors">
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-3 py-1 text-xs font-mono font-semibold rounded-lg bg-gray-100 text-gray-700">
                                                {{ $trx->kode_transaksi }}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">{{ date('d/m/Y H:i', strtotime($trx->tanggal_transaksi)) }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            @if ($trx->tipe_transaksi == 'keluar')
                                                <span class="px-3 py-1.5 inline-flex items-center text-xs font-bold rounded-full bg-gradient-to-r from-emerald-100 to-green-100 text-emerald-700 shadow-sm">
                                                    <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 11l5-5m0 0l5 5m-5-5v12"/>
                                                    </svg>
                                                    Masuk
                                                </span>
                                            @else
                                                <span class="px-3 py-1.5 inline-flex items-center text-xs font-bold rounded-full bg-gradient-to-r from-rose-100 to-red-100 text-rose-700 shadow-sm">
                                                    <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 13l-5 5m0 0l-5-5m5 5V6"/>
                                                    </svg>
                                                    Keluar
                                                </span>
                                            @endif
                                        </td>
                                        
                                        <td class="px-6 py-4 text-sm text-gray-700">
                                            @if($trx->details && $trx->details->count() > 0)
                                                <ul class="space-y-1 text-xs">
                                                    @foreach($trx->details->take(3) as $item)
                                                        <li class="flex items-start">
                                                            <span class="inline-block w-1.5 h-1.5 rounded-full bg-primary-400 mt-1.5 mr-2 flex-shrink-0"></span>
                                                            <span class="font-medium text-gray-900">{{ $item->nama_barang }}</span>
                                                            <span class="text-gray-500 ml-1">({{ $item->jumlah }}x)</span>
                                                        </li>
                                                    @endforeach
                                                    @if($trx->details->count() > 3)
                                                        <li class="text-gray-500 italic ml-3.5">
                                                            + {{ $trx->details->count() - 3 }} barang lainnya...
                                                        </li>
                                                    @endif
                                                </ul>
                                            @else
                                                <span class="text-xs text-gray-400 italic">Data detail tidak tersedia</span>
                                            @endif
                                        </td>

                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-gray-900">Rp {{ number_format($trx->total_nilai) }}</td>
                                        
                                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                                            @if($trx->biaya_jasa > 0)
                                                <div class="font-bold text-indigo-600">
                                                    Rp {{ number_format($trx->biaya_jasa, 0, ',', '.') }}
                                                </div>
                                                @if($trx->mekanik)
                                                    <div class="text-xs text-gray-500 italic mt-1 flex items-center">
                                                        <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                                                        </svg>
                                                        {{ $trx->mekanik }}
                                                    </div>
                                                @endif
                                            @else
                                                <span class="text-gray-400">-</span>
                                            @endif
                                        </td>

                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-center">
                                            <div class="flex justify-center space-x-2" x-data="{ showModal: false }">
                                                <button @click="showModal = true" class="p-2 rounded-lg text-gray-600 hover:text-primary-600 hover:bg-primary-50 transition-colors" title="Lihat Detail">
                                                    <svg class="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                                                    </svg>
                                                </button>

                                                @if ($trx->tipe_transaksi == 'keluar')
                                                    <a href="{{ route('pos.invoice', $trx->id) }}" target="_blank" class="p-2 rounded-lg text-blue-600 hover:text-blue-700 hover:bg-blue-50 transition-colors" title="Cetak Nota">
                                                        <svg class="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z"/>
                                                        </svg>
                                                    </a>
                                                @endif

                                                <!-- MODAL DETAIL -->
                                                <div x-show="showModal" style="display: none;" 
                                                     class="fixed inset-0 z-50 overflow-y-auto" 
                                                     aria-labelledby="modal-title" role="dialog" aria-modal="true">
                                                    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                                                        
                                                        <div x-show="showModal" 
                                                             x-transition:enter="ease-out duration-300"
                                                             x-transition:enter-start="opacity-0"
                                                             x-transition:enter-end="opacity-100"
                                                             x-transition:leave="ease-in duration-200"
                                                             x-transition:leave-start="opacity-100"
                                                             x-transition:leave-end="opacity-0"
                                                             class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" 
                                                             @click="showModal = false" aria-hidden="true"></div>

                                                        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

                                                        <div x-show="showModal" 
                                                             x-transition:enter="ease-out duration-300"
                                                             x-transition:enter-start="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                                                             x-transition:enter-end="opacity-100 translate-y-0 sm:scale-100"
                                                             x-transition:leave="ease-in duration-200"
                                                             x-transition:leave-start="opacity-100 translate-y-0 sm:scale-100"
                                                             x-transition:leave-end="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
                                                             class="inline-block align-bottom bg-white rounded-xl text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg w-full">
                                                            
                                                            <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                                                                <div class="sm:flex sm:items-start">
                                                                    <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left w-full">
                                                                        <h3 class="text-lg leading-6 font-bold text-gray-900 mb-4" id="modal-title">
                                                                            Detail Transaksi: {{ $trx->kode_transaksi }}
                                                                        </h3>
                                                                        <div class="mt-2">
                                                                            <div class="p-3 bg-gradient-to-r from-blue-50 to-green-50 rounded-lg mb-4">
                                                                                <p class="text-sm text-gray-600">
                                                                                    <span class="font-semibold">Tanggal:</span> {{ date('d M Y H:i', strtotime($trx->tanggal_transaksi)) }}
                                                                                </p>
                                                                                <p class="text-sm text-gray-600">
                                                                                    <span class="font-semibold">Kasir:</span> {{ $trx->user->first_name ?? 'System' }}
                                                                                </p>
                                                                            </div>
                                                                            
                                                                            <div class="border border-gray-200 rounded-lg overflow-hidden">
                                                                                <table class="min-w-full divide-y divide-gray-200">
                                                                                    <thead class="bg-gradient-to-r from-gray-50 to-blue-50">
                                                                                        <tr>
                                                                                            <th class="px-3 py-2 text-left text-xs font-semibold text-gray-700 uppercase">Barang</th>
                                                                                            <th class="px-3 py-2 text-center text-xs font-semibold text-gray-700 uppercase">Qty</th>
                                                                                            <th class="px-3 py-2 text-right text-xs font-semibold text-gray-700 uppercase">Total</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody class="divide-y divide-gray-100 bg-white">
                                                                                        @foreach($trx->details as $detail)
                                                                                            <tr class="hover:bg-blue-50/50">
                                                                                                <td class="px-3 py-2 text-sm text-gray-900">{{ $detail->nama_barang }}</td>
                                                                                                <td class="px-3 py-2 text-sm text-center text-gray-700">{{ $detail->jumlah }}</td>
                                                                                                <td class="px-3 py-2 text-sm text-right text-gray-900">Rp {{ number_format($detail->subtotal, 0, ',', '.') }}</td>
                                                                                            </tr>
                                                                                        @endforeach
                                                                                        
                                                                                        @if($trx->biaya_jasa > 0)
                                                                                        <tr class="bg-amber-50">
                                                                                            <td class="px-3 py-2 text-sm text-gray-900 font-medium">
                                                                                                <div class="flex items-center">
                                                                                                    <svg class="w-4 h-4 mr-1 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"/>
                                                                                                    </svg>
                                                                                                    Jasa Servis
                                                                                                </div>
                                                                                                @if($trx->mekanik) 
                                                                                                    <span class="text-xs font-normal text-amber-600">({{ $trx->mekanik }})</span> 
                                                                                                @endif
                                                                                            </td>
                                                                                            <td class="px-3 py-2 text-sm text-center text-gray-700">1</td>
                                                                                            <td class="px-3 py-2 text-sm text-right text-gray-900 font-medium">Rp {{ number_format($trx->biaya_jasa, 0, ',', '.') }}</td>
                                                                                        </tr>
                                                                                        @endif
                                                                                    </tbody>
                                                                                    <tfoot class="bg-gradient-to-r from-gray-50 to-blue-50">
                                                                                        <tr>
                                                                                            <td colspan="2" class="px-3 py-3 text-sm font-bold text-gray-900 text-right">Grand Total</td>
                                                                                            <td class="px-3 py-3 text-sm font-bold text-primary-600 text-right">Rp {{ number_format($trx->total_nilai, 0, ',', '.') }}</td>
                                                                                        </tr>
                                                                                    </tfoot>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                                                                <button type="button" @click="showModal = false" class="w-full inline-flex justify-center rounded-lg border border-gray-300 shadow-sm px-5 py-2.5 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 sm:mt-0 sm:ml-3 sm:w-auto">
                                                                    Tutup
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="7" class="px-6 py-12 text-center">
                                            <div class="flex flex-col items-center">
                                                <div class="p-3 rounded-full bg-gradient-to-br from-gray-100 to-blue-100 mb-3">
                                                    <svg class="h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                                                    </svg>
                                                </div>
                                                <p class="text-sm font-medium text-gray-600">Tidak ada transaksi pada periode ini</p>
                                            </div>
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-6">
                        {{ $riwayat_transaksi->links() }}
                    </div>
                </div>
            </div>

            <!-- 4. LAPORAN STOK KRITIS -->
            <div class="bg-white overflow-hidden shadow-soft-lg sm:rounded-xl border border-gray-100">
                <div class="p-6">
                    <div class="flex items-center mb-6">
                        <div class="p-3 rounded-xl bg-gradient-to-br from-rose-400 to-red-500 mr-4">
                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                            </svg>
                        </div>
                        <div>
                            <h3 class="text-lg font-bold text-gray-800">Peringatan Stok Kritis</h3>
                            <p class="text-sm text-gray-600">Barang yang perlu segera di-restock</p>
                        </div>
                    </div>

                    <div class="overflow-x-auto rounded-lg border border-gray-200">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gradient-to-r from-gray-50 to-red-50">
                                <tr>
                                    <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Kode</th>
                                    <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Nama Barang</th>
                                    <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Min</th>
                                    <th class="px-6 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Stok</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-100">
                                @forelse ($laporan_stok_kritis as $barang)
                                    <tr class="bg-gradient-to-r from-rose-50 to-red-50 hover:from-rose-100 hover:to-red-100 transition-colors">
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-3 py-1 text-xs font-mono font-semibold rounded-lg bg-rose-100 text-rose-700">
                                                {{ $barang->kode_barang }}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-semibold text-gray-900">{{ $barang->nama_barang }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">{{ $barang->stok_minimum }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <span class="px-3 py-1.5 inline-flex text-xs font-bold rounded-full bg-rose-100 text-rose-700">
                                                {{ $barang->jumlah_stok }} ⚠️
                                            </span>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="4" class="px-6 py-12 text-center">
                                            <div class="flex flex-col items-center">
                                                <div class="p-3 rounded-full bg-gradient-to-br from-emerald-100 to-green-100 mb-3">
                                                    <svg class="h-10 w-10 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                                    </svg>
                                                </div>
                                                <p class="text-sm font-medium text-gray-600">Aman! Tidak ada stok yang kritis 🎉</p>
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
    </div>
</x-app-layout>