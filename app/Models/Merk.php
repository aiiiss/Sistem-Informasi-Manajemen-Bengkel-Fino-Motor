<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Merk
 * 
 * @property int $id
 * @property string $nama_merk
 * @property string|null $logo
 * @property string|null $catatan
 * @property bool $is_active
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class Merk extends Model
{
	protected $table = 'merk';
	public $incrementing = false;

	protected $casts = [
		'id' => 'int',
		'is_active' => 'bool'
	];

	protected $fillable = [
		'id',
		'nama_merk',
		'logo',
		'catatan',
		'is_active'
	];
}
