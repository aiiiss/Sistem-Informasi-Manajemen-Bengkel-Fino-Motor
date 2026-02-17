<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kategori extends Model
{
    protected $table = 'kategori';
    
    // Pastikan ID auto increment (standar Laravel)
    protected $primaryKey = 'id';
    public $incrementing = true;
    
    // Aktifkan timestamps jika tabel Anda punya created_at & updated_at
    public $timestamps = true;

    protected $fillable = [
        'nama_kategori',
        'catatan',
        'is_active'
    ];

    /**
     * Relasi: Satu Kategori memiliki BANYAK Barang.
     */
    public function barangs()
    {
        // Menghubungkan Kategori ke model Barang
        return $this->hasMany(Barang::class, 'kategori_id', 'id');
    }
}