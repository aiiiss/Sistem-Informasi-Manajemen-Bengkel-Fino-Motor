<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Barang Masuk (Pembelian)') }}
        </h2>
    </x-slot>

    <div class="py-12 bg-gradient-to-br from-blue-50 via-white to-green-50 min-h-screen">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            
            <!-- Pesan Alert -->
            @if (session('success'))
                <div class="mb-6 p-4 bg-gradient-to-r from-emerald-50 to-green-50 border-l-4 border-emerald-500 rounded-lg shadow-soft">
                    <div class="flex items-center">
                        <div class="flex-shrink-0">
                            <svg class="h-5 w-5 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                        <p class="ml-3 text-sm font-medium text-emerald-800">{{ session('success') }}</p>
                    </div>
                </div>
            @endif
            @if (session('error'))
                <div class="mb-6 p-4 bg-gradient-to-r from-rose-50 to-red-50 border-l-4 border-rose-500 rounded-lg shadow-soft">
                    <div class="flex items-center">
                        <div class="flex-shrink-0">
                            <svg class="h-5 w-5 text-rose-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                        <p class="ml-3 text-sm font-medium text-rose-800">{{ session('error') }}</p>
                    </div>
                </div>
            @endif
            
            <!-- Layout 2 Kolom -->
            <div class="grid grid-cols-1 md:grid-cols-5 gap-6">

                <!-- Kolom Kiri: Daftar Barang (Katalog) -->
                <div class="md:col-span-3">
                    <div class="bg-white overflow-hidden shadow-soft-lg sm:rounded-xl border border-gray-100">
                        <div class="p-6">
                            <div class="flex items-center mb-6">
                                <div class="p-3 rounded-xl bg-gradient-to-br from-primary-400 to-primary-500 mr-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
                                    </svg>
                                </div>
                                <div>
                                    <h3 class="text-lg font-bold text-gray-800">Daftar Katalog Barang</h3>
                                    <p class="text-sm text-gray-600">Pilih barang untuk dibeli</p>
                                </div>
                            </div>
                            
                            <!-- Search Bar -->
                            <form action="{{ route('barang-masuk.index') }}" method="GET" class="mb-4">
                                <div class="relative">
                                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                        <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                                        </svg>
                                    </div>
                                    <input type="text" name="search" 
                                           class="block w-full pl-10 pr-3 py-2.5 rounded-lg shadow-sm border-gray-300 focus:border-primary-400 focus:ring focus:ring-primary-200 focus:ring-opacity-50 transition-all duration-200" 
                                           placeholder="Cari barang..."
                                           value="{{ request('search') }}">
                                </div>
                            </form>
                            
                            <div class="overflow-auto max-h-[60vh] border border-gray-200 rounded-lg">
                                <table class="min-w-full divide-y divide-gray-200">
                                    <thead class="bg-gradient-to-r from-gray-50 to-blue-50 sticky top-0">
                                        <tr>
                                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Nama Barang</th>
                                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Stok Saat Ini</th>
                                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Harga Beli</th>
                                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-100 bg-white">
                                        @foreach ($semua_barang as $barang)
                                            <tr class="hover:bg-blue-50/50 transition-colors">
                                                <td class="px-4 py-3">
                                                    <div class="text-sm font-semibold text-gray-900">{{ $barang->nama_barang }}</div>
                                                    <div class="text-xs text-gray-500 mt-1">
                                                        <span class="px-2 py-0.5 rounded-md bg-gray-100 font-mono">{{ $barang->kode_barang }}</span>
                                                    </div>
                                                </td>
                                                <td class="px-4 py-3">
                                                    @if($barang->jumlah_stok <= $barang->stok_minimum)
                                                        <span class="px-3 py-1 inline-flex text-xs leading-5 font-bold rounded-full bg-rose-100 text-rose-700">
                                                            {{ $barang->jumlah_stok }} ⚠️
                                                        </span>
                                                    @else
                                                        <span class="px-3 py-1 inline-flex text-xs leading-5 font-bold rounded-full bg-emerald-100 text-emerald-700">
                                                            {{ $barang->jumlah_stok }}
                                                        </span>
                                                    @endif
                                                </td>
                                                <td class="px-4 py-3 text-sm font-bold text-gray-900">Rp {{ number_format($barang->harga_beli) }}</td>
                                                <td class="px-4 py-3">
                                                    <form action="{{ route('barang-masuk.cart.add', $barang->id) }}" method="POST" class="flex items-center">
                                                        @csrf
                                                        <input type="number" name="quantity" value="0" min="0" 
                                                               class="w-16 rounded-lg shadow-sm border-gray-300 focus:border-emerald-400 focus:ring focus:ring-emerald-200 focus:ring-opacity-50 text-sm py-1.5">
                                                        
                                                        <button type="submit" 
                                                                class="ms-2 inline-flex items-center px-3 py-1.5 bg-gradient-to-r from-emerald-500 to-green-500 rounded-lg font-semibold text-xs text-white hover:from-emerald-600 hover:to-green-600 transition-all shadow-sm">
                                                            <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                                                            </svg>
                                                            Add
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            
                            <!-- Paginasi -->
                            <div class="mt-4">
                                {{ $semua_barang->withQueryString()->links() }}
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Kolom Kanan: Keranjang Pembelian -->
                <div class="md:col-span-2">
                    <div class="bg-white overflow-hidden shadow-soft-lg sm:rounded-xl border border-gray-100 sticky top-6">
                        <div class="p-6">
                            <div class="flex items-center mb-6">
                                <div class="p-3 rounded-xl bg-gradient-to-br from-amber-400 to-orange-500 mr-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                                    </svg>
                                </div>
                                <div>
                                    <h3 class="text-lg font-bold text-gray-800">Keranjang Pembelian</h3>
                                    <p class="text-sm text-gray-600">{{ count($cart) }} item</p>
                                </div>
                            </div>
                            
                            <form action="{{ route('barang-masuk.store') }}" method="POST">
                                @csrf
                                
                                <!-- Daftar Item di Keranjang -->
                                <div class="overflow-auto max-h-[45vh] mb-4 space-y-3">
                                    @forelse ($cart as $id => $details)
                                        <div class="p-3 bg-gradient-to-r from-gray-50 to-blue-50 rounded-lg border border-gray-200">
                                            <div class="flex justify-between items-start mb-2">
                                                <div class="flex-1">
                                                    <span class="font-semibold text-gray-900">{{ $details['nama_barang'] }}</span>
                                                </div>
                                                <a href="{{ route('barang-masuk.cart.remove', $id) }}" 
                                                   class="ml-2 flex-shrink-0 w-6 h-6 flex items-center justify-center rounded-full bg-rose-100 text-rose-600 hover:bg-rose-200 transition-colors">
                                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                                                    </svg>
                                                </a>
                                            </div>
                                            <div class="flex justify-between items-center text-sm">
                                                <span class="text-gray-600">{{ $details['quantity'] }} × Rp {{ number_format($details['harga_beli']) }}</span>
                                                <span class="font-bold text-gray-900">Rp {{ number_format($details['harga_beli'] * $details['quantity']) }}</span>
                                            </div>
                                        </div>
                                    @empty
                                        <div class="text-center py-8">
                                            <div class="p-3 rounded-full bg-gradient-to-br from-gray-100 to-blue-100 w-16 h-16 mx-auto mb-3 flex items-center justify-center">
                                                <svg class="h-8 w-8 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"/>
                                                </svg>
                                            </div>
                                            <p class="text-sm text-gray-500">Keranjang pembelian kosong</p>
                                        </div>
                                    @endforelse
                                </div>

                                <!-- Total Belanja -->
                                <div class="border-t border-gray-200 pt-4">
                                    <div class="flex justify-between items-center mb-4 p-3 bg-gradient-to-r from-blue-50 to-green-50 rounded-lg">
                                        <span class="font-bold text-gray-800">Total Pembelian:</span>
                                        <span class="font-bold text-xl bg-gradient-to-r from-emerald-600 to-green-500 bg-clip-text text-transparent">Rp {{ number_format($total_pembelian) }}</span>
                                    </div>

                                    <!-- Tombol Selesaikan Transaksi -->
                                    <button type="submit" 
                                            class="w-full px-4 py-3 bg-gradient-to-r from-emerald-500 to-green-500 rounded-lg font-semibold text-sm text-white hover:from-emerald-600 hover:to-green-600 focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:ring-offset-2 transition-all duration-200 shadow-md hover:shadow-lg transform hover:-translate-y-0.5 disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none"
                                            @if (empty($cart)) disabled @endif>
                                        <div class="flex items-center justify-center">
                                            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                                            </svg>
                                            Simpan Pembelian (Tambah Stok)
                                        </div>
                                    </button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

            </div> <!-- End Grid -->

        </div>
    </div>
</x-app-layout>