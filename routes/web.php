<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\PosController;
use App\Http\Controllers\BarangMasukController;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\KategoriController;

// ... (kode rute yang sudah ada) ...

Route::get('/', function () {
    return view('welcome');
});

// PERBAIKAN: Rute Dashboard sekarang memanggil DashboardController
Route::get('/dashboard', [DashboardController::class, 'index'])
    ->middleware(['auth', 'verified'])->name('dashboard');

// KITA GABUNGKAN SEMUA RUTE OTENTIKASI KE DALAM SATU GRUP
Route::middleware('auth')->group(function () {
    
    // Rute Profile (Bawaan Breeze)
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    
    // Rute Modul 3: Manajemen Barang (Katalog)
    Route::resource('barang', BarangController::class);
    
    // Rute Modul 6: POS (Kasir Penjualan)
    Route::get('/pos', [PosController::class, 'index'])->name('pos.index');
    Route::post('/pos', [PosController::class, 'store'])->name('pos.store');
    Route::post('/pos/add/{barang}', [PosController::class, 'addToCart'])->name('pos.cart.add');
    Route::get('/pos/remove/{barang_id}', [PosController::class, 'removeFromCart'])->name('pos.cart.remove');
    // BARIS BARU: Rute untuk mencetak invoice
    Route::get('/pos/invoice/{transaksi}', [PosController::class, 'printInvoice'])->name('pos.invoice');
    
    // Rute Modul 4: Barang Masuk (Pembelian)
    Route::get('/barang-masuk', [BarangMasukController::class, 'index'])->name('barang-masuk.index');
    Route::post('/barang-masuk', [BarangMasukController::class, 'store'])->name('barang-masuk.store');
    Route::post('/barang-masuk/add/{barang}', [BarangMasukController::class, 'addToPurchaseCart'])->name('barang-masuk.cart.add');
    Route::get('/barang-masuk/remove/{barang_id}', [BarangMasukController::class, 'removeFromPurchaseCart'])->name('barang-masuk.cart.remove');

    Route::resource('kategori', KategoriController::class);

    // Rute Modul 8: Laporan
    Route::get('/laporan', [LaporanController::class, 'index'])->name('laporan.index');
     Route::get('/laporan/export', [LaporanController::class, 'export'])->name('laporan.export');

});


require __DIR__ . '/auth.php';