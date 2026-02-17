<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class VInventorySummary
 * 
 * @property string $nama_kategori
 * @property int $jumlah_item
 * @property float|null $total_stok
 * @property float|null $nilai_inventory_beli
 * @property float|null $nilai_inventory_jual
 * @property float|null $potensi_profit
 *
 * @package App\Models
 */
class VInventorySummary extends Model
{
	protected $table = 'v_inventory_summary';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'jumlah_item' => 'int',
		'total_stok' => 'float',
		'nilai_inventory_beli' => 'float',
		'nilai_inventory_jual' => 'float',
		'potensi_profit' => 'float'
	];

	protected $fillable = [
		'nama_kategori',
		'jumlah_item',
		'total_stok',
		'nilai_inventory_beli',
		'nilai_inventory_jual',
		'potensi_profit'
	];
}
