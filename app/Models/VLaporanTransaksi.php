<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class VLaporanTransaksi
 * 
 * @property int $id
 * @property string $kode_transaksi
 * @property Carbon $tanggal_transaksi
 * @property Carbon|null $tanggal
 * @property string $tipe_transaksi
 * @property string|null $keterangan
 * @property int $jumlah_item
 * @property float|null $total_qty
 * @property float $total_nilai
 * @property string|null $nama_user
 * @property string|null $role_user
 * @property Carbon $created_at
 *
 * @package App\Models
 */
class VLaporanTransaksi extends Model
{
	protected $table = 'v_laporan_transaksi';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id' => 'int',
		'tanggal_transaksi' => 'datetime',
		'tanggal' => 'datetime',
		'jumlah_item' => 'int',
		'total_qty' => 'float',
		'total_nilai' => 'float'
	];

	protected $fillable = [
		'id',
		'kode_transaksi',
		'tanggal_transaksi',
		'tanggal',
		'tipe_transaksi',
		'keterangan',
		'jumlah_item',
		'total_qty',
		'total_nilai',
		'nama_user',
		'role_user'
	];
}
