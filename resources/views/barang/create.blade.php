<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Tambah Barang Baru (Katalog)') }}
        </h2>
    </x-slot>

    <div class="py-12 bg-gradient-to-br from-blue-50 via-white to-green-50 min-h-screen">
        <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
            <!-- Header Card -->
            <div class="mb-6 bg-white rounded-xl shadow-soft border border-blue-100 p-6">
                <div class="flex items-center">
                    <div class="p-3 rounded-xl bg-gradient-to-br from-primary-400 to-primary-500 mr-4">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
                        </svg>
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-gray-800">Form Barang Baru</h3>
                        <p class="text-sm text-gray-600">Isi data barang yang akan ditambahkan ke katalog</p>
                    </div>
                </div>
            </div>

            <!-- Form Card -->
            <div class="bg-white overflow-hidden shadow-soft-lg sm:rounded-xl border border-gray-100">
                <div class="p-8">
                    
                    <form method="POST" action="{{ route('barang.store') }}" class="space-y-6">
                        @csrf

                        <!-- Nama Barang -->
                        <div class="group">
                            <label for="nama_barang" class="block font-semibold text-sm text-gray-700 mb-2 flex items-center">
                                <svg class="w-4 h-4 mr-2 text-primary-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"/>
                                </svg>
                                Nama Barang
                            </label>
                            <input id="nama_barang" 
                                   class="block w-full rounded-lg shadow-sm border-gray-300 focus:border-primary-400 focus:ring focus:ring-primary-200 focus:ring-opacity-50 transition-all duration-200 placeholder-gray-400" 
                                   type="text" 
                                   name="nama_barang" 
                                   placeholder="" 
                                   required 
                                   autofocus />
                        </div>

                        <!-- Grid 2 Kolom untuk Harga -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            
                            <!-- Harga Beli -->
                            <div class="group">
                                <label for="harga_beli" class="block font-semibold text-sm text-gray-700 mb-2 flex items-center">
                                    <svg class="w-4 h-4 mr-2 text-emerald-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 11l5-5m0 0l5 5m-5-5v12"/>
                                    </svg>
                                    Harga Beli (Modal)
                                </label>
                                <div class="relative">
                                    <span class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-500 font-medium">Rp</span>
                                    <input id="harga_beli" 
                                           class="block w-full pl-10 rounded-lg shadow-sm border-gray-300 focus:border-emerald-400 focus:ring focus:ring-emerald-200 focus:ring-opacity-50 transition-all duration-200" 
                                           type="number" 
                                           name="harga_beli" 
                                           value="0" 
                                           placeholder="0" 
                                           required />
                                </div>
                            </div>

                            <!-- Harga Jual -->
                            <div class="group">
                                <label for="harga_jual" class="block font-semibold text-sm text-gray-700 mb-2 flex items-center">
                                    <svg class="w-4 h-4 mr-2 text-rose-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"/>
                                    </svg>
                                    Harga Jual
                                </label>
                                <div class="relative">
                                    <span class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-500 font-medium">Rp</span>
                                    <input id="harga_jual" 
                                           class="block w-full pl-10 rounded-lg shadow-sm border-gray-300 focus:border-rose-400 focus:ring focus:ring-rose-200 focus:ring-opacity-50 transition-all duration-200" 
                                           type="number" 
                                           name="harga_jual" 
                                           value="0" 
                                           placeholder="0" 
                                           required />
                                </div>
                            </div>

                        </div>
                        
                        <!-- Kategori (Dropdown) -->
                        <div class="group">
                            <label for="kategori_id" class="block font-semibold text-sm text-gray-700 mb-2 flex items-center">
                                <svg class="w-4 h-4 mr-2 text-amber-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"/>
                                </svg>
                                Kategori
                            </label>
                            <select id="kategori_id" 
                                    name="kategori_id" 
                                    class="block w-full rounded-lg shadow-sm border-gray-300 focus:border-amber-400 focus:ring focus:ring-amber-200 focus:ring-opacity-50 transition-all duration-200">
                                <option value="" class="text-gray-500">-- Pilih Kategori --</option>
                                @foreach ($semua_kategori as $kategori)
                                    <option value="{{ $kategori->id }}">
                                        {{ $kategori->nama_kategori }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Divider -->
                        <div class="border-t border-gray-200 my-6"></div>

                        <!-- Buttons -->
                        <div class="flex items-center justify-end space-x-3">
                            <a href="{{ route('barang.index') }}" 
                               class="inline-flex items-center px-5 py-2.5 bg-white border border-gray-300 rounded-lg font-semibold text-sm text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-gray-300 focus:ring-offset-2 transition-all duration-200 shadow-sm">
                                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                                </svg>
                                Batal
                            </a>
                            <button type="submit" 
                                    class="inline-flex items-center px-6 py-2.5 bg-gradient-to-r from-primary-500 to-primary-600 border border-transparent rounded-lg font-semibold text-sm text-white hover:from-primary-600 hover:to-primary-700 focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2 transition-all duration-200 shadow-md hover:shadow-lg transform hover:-translate-y-0.5">
                                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                                </svg>
                                Simpan Barang
                            </button>
                        </div>
                    </form>

                </div>
            </div>

            <!-- Info Card -->
            <div class="mt-6 bg-gradient-to-r from-blue-50 to-cyan-50 rounded-xl border border-blue-200 p-4">
                <div class="flex items-start">
                    <div class="flex-shrink-0">
                        <svg class="h-5 w-5 text-primary-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                    </div>
                    <div class="ml-3">
                        <p class="text-sm text-gray-700">
                            <span class="font-semibold">Tips:</span> Pastikan harga jual lebih besar dari harga beli agar mendapatkan keuntungan. Stok barang akan dimulai dari 0.
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</x-app-layout>