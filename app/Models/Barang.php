<?php

namespace App\Models;

// PENTING: Gunakan Model standar Laravel, BUKAN Reliese
use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    /**
     * Nama tabel yang terhubung dengan model.
     */
    protected $table = 'barang';

    /**
     * Kunci utama (primary key) tabel.
     */
    protected $primaryKey = 'id';

    /**
     * Menunjukkan apakah ID-nya auto-incrementing.
     * INI YANG PALING PENTING UNTUK MEMPERBAIKI ERROR 'Duplicate entry 0'
     */
    public $incrementing = true;

    /**
     * Kolom yang diizinkan untuk diisi secara massal (mass assignable).
     */
    protected $fillable = [
        'kode_barang',
        'nama_barang',
        'jumlah_stok',
        'stok_minimum',
        'tipe_stok',
        'harga_beli',
        'harga_jual',
        'gambar',
        'kategori_id',
        'users_id',
        'is_active'
    ];

    /**
     * Relasi ke Kategori
     */
    public function kategori()
    {
        return $this->belongsTo(Kategori::class, 'kategori_id', 'id');
    }

    /**
     * Relasi ke Detail Transaksi
     */
    public function detailTransaksis()
    {
        return $this->hasMany(DetailTransaksi::class, 'barang_id', 'id');
    }
}