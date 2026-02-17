<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class LogPerubahanHarga
 * 
 * @property int $id
 * @property int $barang_id
 * @property float|null $harga_beli_lama
 * @property float|null $harga_beli_baru
 * @property float|null $harga_jual_lama
 * @property float|null $harga_jual_baru
 * @property int|null $users_id
 * @property Carbon $created_at
 *
 * @package App\Models
 */
class LogPerubahanHarga extends Model
{
	protected $table = 'log_perubahan_harga';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id' => 'int',
		'barang_id' => 'int',
		'harga_beli_lama' => 'float',
		'harga_beli_baru' => 'float',
		'harga_jual_lama' => 'float',
		'harga_jual_baru' => 'float',
		'users_id' => 'int'
	];

	protected $fillable = [
		'id',
		'barang_id',
		'harga_beli_lama',
		'harga_beli_baru',
		'harga_jual_lama',
		'harga_jual_baru',
		'users_id'
	];
}
