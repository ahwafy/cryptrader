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
                'key' => 'early_profit_exit_status',
                'value' => 'inactive',
                'description' => 'Early profit exit mode (inactive, active, ai_decide)',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'key' => 'early_profit_exit_hours',
                'value' => '1',
                'description' => 'Minimum holding time (in hours) before early profit checks trigger',
                'created_at' => now(),
                'updated_at' => now(),
            ]
        ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::table('settings')->whereIn('key', ['early_profit_exit_status', 'early_profit_exit_hours'])->delete();
    }
};
