<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class RiwayatStok
 * 
 * @property int $id
 * @property int|null $barang_id
 * @property string $nama_barang
 * @property int $jumlah
 * @property string $tipe
 * @property string|null $keterangan
 * @property Carbon|null $tanggal
 *
 * @package App\Models
 */
class RiwayatStok extends Model
{
	protected $table = 'riwayat_stok';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id' => 'int',
		'barang_id' => 'int',
		'jumlah' => 'int',
		'tanggal' => 'datetime'
	];

	protected $fillable = [
		'id',
		'barang_id',
		'nama_barang',
		'jumlah',
		'tipe',
		'keterangan',
		'tanggal'
	];
}
