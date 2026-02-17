<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Ukuran
 * 
 * @property int $id
 * @property string $nama_ukuran
 * @property string|null $catatan
 * @property bool $is_active
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class Ukuran extends Model
{
	protected $table = 'ukuran';
	public $incrementing = false;

	protected $casts = [
		'id' => 'int',
		'is_active' => 'bool'
	];

	protected $fillable = [
		'id',
		'nama_ukuran',
		'catatan',
		'is_active'
	];
}
