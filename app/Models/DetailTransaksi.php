<?php

namespace App\Models;

// GUNAKAN MODEL BAWAAN LARAVEL
use Illuminate\Database\Eloquent\Model;

class DetailTransaksi extends Model
{
    /**
     * Nama tabel yang terhubung dengan model.
     * @var string
     */
    protected $table = 'detail_transaksi';

    /**
     * Kunci utama (primary key) tabel.
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * Menunjukkan apakah ID-nya auto-incrementing.
     * @var bool
     */
    public $incrementing = true;

    /**
     * Model ini tidak menggunakan 'updated_at'
     * @var bool
     */
    public $timestamps = false; 

    /**
     * Kolom yang diizinkan untuk diisi secara massal (mass assignable).
     * @var array
     */
    protected $fillable = [
        'transaksi_id',
        'barang_id',
        'nama_barang',
        'jumlah',
        'harga_satuan',
        'subtotal',
    ];

    /**
     * Definisikan relasi: Satu Detail milik SATU Transaksi.
     */
    public function transaction()
    {
        return $this->belongsTo(Transaksi::class, 'transaksi_id', 'id');
    }

    /**
     * Definisikan relasi: Satu Detail milik SATU Barang.
     */
    public function item()
    {
        return $this->belongsTo(Barang::class, 'barang_id', 'id');
    }
}