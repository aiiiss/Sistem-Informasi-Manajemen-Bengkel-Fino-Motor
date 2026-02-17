<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Detail Kategori: ') . $kategori->nama_kategori }}
        </h2>
    </x-slot>

    <div class="py-12 bg-gradient-to-br from-blue-50 to-indigo-100">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-lg sm:rounded-xl border border-blue-200">
                <div class="p-6">

                    <!-- Informasi Kategori -->
                    <div class="mb-6 bg-gradient-to-r from-blue-100 to-cyan-100 p-5 rounded-lg border-l-4 border-blue-500">
                        <p class="text-sm text-blue-600 font-semibold mb-1">Catatan:</p>
                        <p class="text-lg text-gray-800">{{ $kategori->catatan ?? '-' }}</p>
                    </div>

                    <h3 class="text-xl font-bold mb-4 text-blue-700 flex items-center">
                        <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"></path>
                        </svg>
                        Daftar Barang dalam Kategori Ini
                    </h3>

                    <!-- Tabel Barang -->
                    <div class="overflow-x-auto border border-blue-200 rounded-xl shadow-md">
                        <table class="min-w-full divide-y divide-blue-200">
                            <thead class="bg-gradient-to-r from-blue-500 to-indigo-600">
                                <tr>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-white uppercase tracking-wider">Kode</th>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-white uppercase tracking-wider">Nama Barang</th>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-white uppercase tracking-wider">Stok</th>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-white uppercase tracking-wider">Harga Jual</th>
                                    <th class="px-6 py-4 text-left text-xs font-bold text-white uppercase tracking-wider">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-blue-100">
                                @forelse ($barangs as $index => $barang)
                                <tr class="hover:bg-blue-50 transition duration-200 {{ $index % 2 == 0 ? 'bg-blue-25' : 'bg-white' }}">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-semibold text-blue-700">
                                        <span class="bg-blue-100 px-3 py-1 rounded-full">{{ $barang->kode_barang }}</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-800">{{ $barang->nama_barang }}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm">
                                        @if($barang->jumlah_stok <= 5)
                                            <span class="bg-red-100 text-red-700 px-3 py-1 rounded-full font-bold text-xs inline-flex items-center">
                                                <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                                                </svg>
                                                {{ $barang->jumlah_stok }}
                                            </span>
                                        @else
                                            <span class="bg-green-100 text-green-700 px-3 py-1 rounded-full font-semibold text-xs">
                                                {{ $barang->jumlah_stok }}
                                            </span>
                                        @endif
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-semibold text-green-600">
                                        Rp {{ number_format($barang->harga_jual, 0, ',', '.') }}
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm">
                                        <a href="{{ route('barang.edit', $barang->id) }}" 
                                           class="inline-flex items-center px-4 py-2 bg-gradient-to-r from-cyan-500 to-blue-500 hover:from-cyan-600 hover:to-blue-600 text-white font-semibold rounded-lg transition duration-200 shadow-md hover:shadow-lg">
                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                            </svg>
                                            Edit
                                        </a>
                                    </td>
                                </tr>
                                @empty
                                <tr>
                                    <td colspan="5" class="px-6 py-12 text-center">
                                        <div class="flex flex-col items-center justify-center">
                                            <svg class="w-16 h-16 text-blue-300 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"></path>
                                            </svg>
                                            <p class="text-gray-500 text-lg font-medium">Belum ada barang di kategori ini</p>
                                            <p class="text-gray-400 text-sm mt-1">Tambahkan barang baru untuk memulai</p>
                                        </div>
                                    </td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    <!-- Paginasi & Tombol Kembali -->
                    <div class="mt-6 flex justify-between items-center">
                        <div>
                            {{ $barangs->links() }}
                        </div>
                        <a href="{{ route('kategori.index') }}" 
                           class="inline-flex items-center px-6 py-3 bg-gradient-to-r from-gray-500 to-gray-600 hover:from-gray-600 hover:to-gray-700 text-white font-semibold rounded-lg transition duration-200 shadow-md hover:shadow-lg">
                            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                            </svg>
                            Kembali
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</x-app-layout>