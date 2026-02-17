<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('POS (Kasir)') }}
        </h2>
    </x-slot>

    <div class="py-12 bg-gradient-to-br from-blue-50 via-white to-green-50 min-h-screen">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            
            <!-- ALERT -->
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

            <div class="grid grid-cols-1 md:grid-cols-5 gap-6">

                <!-- KOLOM KIRI: DAFTAR BARANG -->
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
                                    <h3 class="text-lg font-bold text-gray-800">Daftar Barang</h3>
                                    <p class="text-sm text-gray-600">Pilih barang untuk dijual</p>
                                </div>
                            </div>
                            
                            <form action="{{ route('pos.index') }}" method="GET" class="mb-4">
                                <div class="flex">
                                    <div class="relative flex-grow">
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
                                    <button type="submit" class="ml-2 px-5 py-2.5 bg-gradient-to-r from-gray-700 to-gray-800 text-white rounded-lg hover:from-gray-800 hover:to-gray-900 transition-all duration-200 shadow-md hover:shadow-lg font-medium">
                                        Cari
                                    </button>
                                </div>
                            </form>
                            
                            <div class="overflow-auto max-h-[60vh] border border-gray-200 rounded-lg">
                                <table class="min-w-full divide-y divide-gray-200">
                                    <thead class="bg-gradient-to-r from-gray-50 to-blue-50 sticky top-0">
                                        <tr>
                                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Barang</th>
                                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Stok</th>
                                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Harga</th>
                                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-100 bg-white">
                                        @foreach ($barangs as $barang)
                                            <tr class="hover:bg-blue-50/50 transition-colors">
                                                <td class="px-4 py-3">
                                                    <div class="font-semibold text-gray-900">{{ $barang->nama_barang }}</div>
                                                    <div class="text-xs text-gray-500 mt-1">
                                                        <span class="px-2 py-0.5 rounded-md bg-gray-100 font-mono">{{ $barang->kode_barang }}</span>
                                                    </div>
                                                </td>
                                                <td class="px-4 py-3">
                                                    @if($barang->jumlah_stok <= 5)
                                                        <span class="px-3 py-1 inline-flex text-xs leading-5 font-bold rounded-full bg-rose-100 text-rose-700">
                                                            {{ $barang->jumlah_stok }} ⚠️
                                                        </span>
                                                    @else
                                                        <span class="px-3 py-1 inline-flex text-xs leading-5 font-bold rounded-full bg-emerald-100 text-emerald-700">
                                                            {{ $barang->jumlah_stok }}
                                                        </span>
                                                    @endif
                                                </td>
                                                <td class="px-4 py-3 text-sm font-bold text-gray-900">Rp {{ number_format($barang->harga_jual, 0, ',', '.') }}</td>
                                                <td class="px-4 py-3">
                                                    <form action="{{ route('pos.cart.add', $barang->id) }}" method="POST" class="flex items-center">
                                                        @csrf
                                                        <input type="number" name="quantity" value="1" min="1" 
                                                               class="w-16 rounded-lg shadow-sm border-gray-300 focus:border-primary-400 focus:ring focus:ring-primary-200 focus:ring-opacity-50 text-sm py-1.5 mr-2">
                                                        <button type="submit" 
                                                                class="inline-flex items-center px-3 py-1.5 bg-gradient-to-r from-primary-500 to-primary-600 rounded-lg font-semibold text-xs text-white hover:from-primary-600 hover:to-primary-700 transition-all shadow-sm">
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
                            <div class="mt-4">{{ $barangs->withQueryString()->links() }}</div>
                        </div>
                    </div>
                </div>

                <!-- KOLOM KANAN: KERANJANG & INPUT JASA -->
                <div class="md:col-span-2">
                    <div class="bg-white overflow-hidden shadow-soft-lg sm:rounded-xl border border-gray-100 sticky top-6">
                        <div class="p-6 h-full flex flex-col" x-data="{ biayaJasa: 0, totalBarang: {{ $totalHarga }} }">
                            <div class="flex items-center mb-6">
                                <div class="p-3 rounded-xl bg-gradient-to-br from-rose-400 to-pink-500 mr-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                                    </svg>
                                </div>
                                <div>
                                    <h3 class="text-lg font-bold text-gray-800">Keranjang Belanja</h3>
                                    <p class="text-sm text-gray-600">{{ count($cart) }} item</p>
                                </div>
                            </div>
                            
                            <form action="{{ route('pos.store') }}" method="POST" class="flex-1 flex flex-col">
                                @csrf
                                
                                <!-- List Barang -->
                                <div class="overflow-auto max-h-[30vh] mb-4 flex-1 space-y-2">
                                    @forelse ($cart as $item)
                                        <div class="p-3 bg-gradient-to-r from-gray-50 to-blue-50 rounded-lg border border-gray-200">
                                            <div class="flex justify-between items-start mb-2">
                                                <div class="flex-1">
                                                    <div class="font-semibold text-gray-900">{{ $item['nama_barang'] }}</div>
                                                    <div class="text-xs text-gray-600 mt-1">{{ $item['quantity'] }} × Rp {{ number_format($item['harga_jual'], 0, ',', '.') }}</div>
                                                </div>
                                                <a href="{{ route('pos.cart.remove', $item['id']) }}" 
                                                   class="ml-2 flex-shrink-0 w-6 h-6 flex items-center justify-center rounded-full bg-rose-100 text-rose-600 hover:bg-rose-200 transition-colors">
                                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                                                    </svg>
                                                </a>
                                            </div>
                                            <div class="text-right font-bold text-gray-900">Rp {{ number_format($item['harga_jual'] * $item['quantity'], 0, ',', '.') }}</div>
                                        </div>
                                    @empty
                                        <div class="text-center py-8">
                                            <div class="p-3 rounded-full bg-gradient-to-br from-gray-100 to-blue-100 w-16 h-16 mx-auto mb-3 flex items-center justify-center">
                                                <svg class="h-8 w-8 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"/>
                                                </svg>
                                            </div>
                                            <p class="text-sm text-gray-500">Keranjang masih kosong</p>
                                        </div>
                                    @endforelse
                                </div>

                                <!-- INPUT MEKANIK & JASA -->
                                <div class="border-t border-gray-200 pt-4 mb-4">
                                    <div class="flex items-center mb-3">
                                        <div class="p-2 rounded-lg bg-amber-100 mr-2">
                                            <svg class="w-4 h-4 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"/>
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                            </svg>
                                        </div>
                                        <h4 class="font-semibold text-gray-800 text-sm">Jasa Servis (Opsional)</h4>
                                    </div>
                                    
                                    <!-- Pilih Mekanik -->
                                    <div class="mb-3">
                                        <label class="block text-xs font-semibold text-gray-700 mb-1.5">Nama Mekanik</label>
                                        <select name="mekanik" 
                                                class="w-full rounded-lg border-gray-300 focus:border-amber-400 focus:ring focus:ring-amber-200 focus:ring-opacity-50 text-sm py-2" 
                                                x-on:change="$el.value === '' ? (biayaJasa = 0) : null">
                                            <option value="">- Tidak Ada Jasa -</option>
                                            <option value="Budi">Budi</option>
                                            <option value="Andi">Andi</option>
                                            <option value="Dedi">Dedi</option>
                                            <option value="Lainnya">Lainnya</option>
                                        </select>
                                    </div>

                                    <!-- Input Harga Jasa -->
                                    <div>
                                        <label class="block text-xs font-semibold text-gray-700 mb-1.5">Biaya Jasa</label>
                                        <div class="relative">
                                            <span class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-500 font-medium">Rp</span>
                                            <input type="number" name="biaya_jasa" x-model.number="biayaJasa" min="0" 
                                                   class="w-full pl-10 rounded-lg border-gray-300 focus:border-amber-400 focus:ring focus:ring-amber-200 focus:ring-opacity-50 text-sm py-2 text-right"
                                                   placeholder="0">
                                        </div>
                                    </div>
                                </div>

                                <!-- Area Pembayaran -->
                                <div class="border-t-2 border-gray-200 pt-4 mt-auto">
                                    <div class="space-y-2 mb-4">
                                        <div class="flex justify-between text-sm text-gray-600">
                                            <span>Subtotal Barang:</span>
                                            <span class="font-medium">Rp {{ number_format($totalHarga, 0, ',', '.') }}</span>
                                        </div>
                                        <div class="flex justify-between text-sm text-gray-600">
                                            <span>Biaya Jasa:</span>
                                            <span class="font-medium" x-text="'Rp ' + (biayaJasa || 0).toLocaleString('id-ID')"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="flex justify-between items-center mb-4 p-3 bg-gradient-to-r from-blue-50 to-green-50 rounded-lg">
                                        <span class="font-bold text-gray-800">Total Bayar:</span>
                                        <span class="font-bold text-xl bg-gradient-to-r from-emerald-600 to-green-500 bg-clip-text text-transparent" x-text="'Rp ' + (totalBarang + (biayaJasa || 0)).toLocaleString('id-ID')"></span>
                                    </div>
                                    
                                    <button type="submit" 
                                            class="w-full px-6 py-3 bg-gradient-to-r from-emerald-500 to-green-500 rounded-lg font-bold text-sm text-white hover:from-emerald-600 hover:to-green-600 focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:ring-offset-2 transition-all duration-200 shadow-md hover:shadow-lg transform hover:-translate-y-0.5 uppercase tracking-wider disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none"
                                            @if(empty($cart)) disabled @endif>
                                        <div class="flex items-center justify-center">
                                            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                                            </svg>
                                            Selesaikan Transaksi
                                        </div>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</x-app-layout>