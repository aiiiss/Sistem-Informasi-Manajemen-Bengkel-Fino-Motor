<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class VTransaksiHarian
 * 
 * @property Carbon|null $tanggal
 * @property string $tipe_transaksi
 * @property int $jumlah_transaksi
 * @property float|null $total_nilai
 * @property int $jumlah_user
 *
 * @package App\Models
 */
class VTransaksiHarian extends Model
{
	protected $table = 'v_transaksi_harian';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'tanggal' => 'datetime',
		'jumlah_transaksi' => 'int',
		'total_nilai' => 'float',
		'jumlah_user' => 'int'
	];

	protected $fillable = [
		'tanggal',
		'tipe_transaksi',
		'jumlah_transaksi',
		'total_nilai',
		'jumlah_user'
	];
}
