<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::table('settings')->insertOrIgnore([
            [
                'key' => 'futures_trading_status',
                'value' => 'inactive',
            ],
            [
                'key' => 'max_futures_leverage',
                'value' => '5',
            ]
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::table('settings')
            ->whereIn('key', ['futures_trading_status', 'max_futures_leverage'])
            ->delete();
    }
};
