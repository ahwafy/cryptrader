<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('trades', function (Blueprint $table) {
            $table->float('exit_price')->nullable()->after('entry_price');
            $table->float('pnl')->nullable()->after('outcome'); // Numerical PnL (e.g. -10.5 or 25.0)
        });
    }

    public function down(): void
    {
        Schema::table('trades', function (Blueprint $table) {
            $table->dropColumn(['exit_price', 'pnl']);
        });
    }
};
