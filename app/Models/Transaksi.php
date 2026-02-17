<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    /**
     * Nama tabel yang terhubung dengan model.
     * @var string
     */
    protected $table = 'transaksi';
    
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
     * Kolom yang diizinkan untuk diisi secara massal (mass assignable).
     * @var array
     */
    protected $fillable = [
        'kode_transaksi',
        'tanggal_transaksi',
        'tipe_transaksi',
        'keterangan',
        'total_nilai',
        'users_id',
        // --- TAMBAHAN BARU (WAJIB ADA) ---
        'mekanik',
        'biaya_jasa',
    ];

    /**
     * Definisikan relasi: Satu Transaksi memiliki BANYAK Detail.
     */
    public function details()
    {
        return $this->hasMany(DetailTransaksi::class, 'transaksi_id', 'id');
    }

    /**
     * Alias untuk details() agar kompatibel jika ada kode lain yang memanggil detailTransaksi()
     */
    public function detailTransaksi()
    {
        return $this->hasMany(DetailTransaksi::class, 'transaksi_id', 'id');
    }

    /**
     * Definisikan relasi: Satu Transaksi milik SATU User (Kasir).
     */
    public function user()
    {
        // Relasi ke Model User, melalui foreign key 'users_id'
        return $this->belongsTo(User::class, 'users_id', 'id');
    }
}