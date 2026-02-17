<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">{{ __('Tambah Kategori') }}</h2>
    </x-slot>

    <div class="py-12 bg-gradient-to-br from-blue-50 via-white to-green-50 min-h-screen">
        <div class="max-w-2xl mx-auto sm:px-6 lg:px-8">
            
            <!-- Header Card -->
            <div class="mb-6 bg-white rounded-xl shadow-soft border border-orange-100 p-6">
                <div class="flex items-center">
                    <div class="p-3 rounded-xl bg-gradient-to-br from-amber-400 to-orange-500 mr-4">
                        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"/>
                        </svg>
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-gray-800">Form Kategori Baru</h3>
                        <p class="text-sm text-gray-600">Tambahkan kategori untuk mengorganisir barang</p>
                    </div>
                </div>
            </div>

            <!-- Form Card -->
            <div class="bg-white overflow-hidden shadow-soft-lg sm:rounded-xl border border-gray-100">
                <div class="p-8">
                    <form action="{{ route('kategori.store') }}" method="POST" class="space-y-6">
                        @csrf
                        
                        <!-- Nama Kategori -->
                        <div class="group">
                            <label class="block font-semibold text-sm text-gray-700 mb-2 flex items-center">
                                <svg class="w-4 h-4 mr-2 text-amber-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"/>
                                </svg>
                                Nama Kategori
                            </label>
                            <input type="text" 
                                   name="nama_kategori" 
                                   class="block w-full rounded-lg shadow-sm border-gray-300 focus:border-amber-400 focus:ring focus:ring-amber-200 focus:ring-opacity-50 transition-all duration-200 placeholder-gray-400" 
                                   placeholder="Contoh: Oli Motor, Sparepart, Aksesoris"
                                   required>
                        </div>

                        <!-- Catatan -->
                        <div class="group">
                            <label class="block font-semibold text-sm text-gray-700 mb-2 flex items-center">
                                <svg class="w-4 h-4 mr-2 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                </svg>
                                Catatan (Opsional)
                            </label>
                            <textarea name="catatan" 
                                      rows="4"
                                      class="block w-full rounded-lg shadow-sm border-gray-300 focus:border-amber-400 focus:ring focus:ring-amber-200 focus:ring-opacity-50 transition-all duration-200 placeholder-gray-400"
                                      placeholder="Tambahkan deskripsi atau catatan untuk kategori ini..."></textarea>
                        </div>

                        <!-- Divider -->
                        <div class="border-t border-gray-200 my-6"></div>

                        <!-- Buttons -->
                        <div class="flex items-center justify-end space-x-3">
                            <a href="{{ route('kategori.index') }}" 
                               class="inline-flex items-center px-5 py-2.5 bg-white border border-gray-300 rounded-lg font-semibold text-sm text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-gray-300 focus:ring-offset-2 transition-all duration-200 shadow-sm">
                                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                                </svg>
                                Batal
                            </a>
                            <button type="submit" 
                                    class="inline-flex items-center px-6 py-2.5 bg-gradient-to-r from-amber-500 to-orange-500 border border-transparent rounded-lg font-semibold text-sm text-white hover:from-amber-600 hover:to-orange-600 focus:outline-none focus:ring-2 focus:ring-amber-500 focus:ring-offset-2 transition-all duration-200 shadow-md hover:shadow-lg transform hover:-translate-y-0.5">
                                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                                </svg>
                                Simpan Kategori
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Info Card -->
            <div class="mt-6 bg-gradient-to-r from-orange-50 to-amber-50 rounded-xl border border-orange-200 p-4">
                <div class="flex items-start">
                    <div class="flex-shrink-0">
                        <svg class="h-5 w-5 text-amber-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                    </div>
                    <div class="ml-3">
                        <p class="text-sm text-gray-700">
                            <span class="font-semibold">Tips:</span> Gunakan nama kategori yang jelas dan mudah dikenali untuk memudahkan pencarian barang nantinya.
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</x-app-layout>