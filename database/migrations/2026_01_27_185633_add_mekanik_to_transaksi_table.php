<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('transaksi', function (Blueprint $table) {
            // 1. Kolom Nama Mekanik
            // Kita buat 'nullable' agar jika cuma beli barang (tanpa servis), kolom ini boleh kosong.
            $table->string('mekanik')->nullable()->after('users_id');

            // 2. Kolom Biaya Jasa
            // Kita beri default 0, jadi kalau tidak diisi otomatis harganya 0.
            $table->decimal('biaya_jasa', 15, 2)->default(0)->after('mekanik');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('transaksi', function (Blueprint $table) {
            $table->dropColumn(['mekanik', 'biaya_jasa']);
        });
    }
};