<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Ka
 * 
 * @property int $id
 * @property Carbon $tanggal
 * @property string $jenis
 * @property string|null $keterangan
 * @property float $jumlah
 * @property int $users_id
 * @property Carbon $created_at
 *
 * @package App\Models
 */
class Ka extends Model
{
	protected $table = 'kas';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id' => 'int',
		'tanggal' => 'datetime',
		'jumlah' => 'float',
		'users_id' => 'int'
	];

	protected $fillable = [
		'id',
		'tanggal',
		'jenis',
		'keterangan',
		'jumlah',
		'users_id'
	];
}
