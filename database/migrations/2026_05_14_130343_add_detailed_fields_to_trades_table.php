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
        Schema::table('trades', function (Blueprint $table) {
            $table->string('trade_type')->default('spot')->after('asset');
            $table->text('target_prices')->nullable()->after('entry_price');
            $table->float('stop_loss')->nullable()->after('target_prices');
            $table->integer('leverage')->default(1)->after('trade_type');
        });
    }

    public function down(): void
    {
        Schema::table('trades', function (Blueprint $table) {
            $table->dropColumn(['trade_type', 'target_prices', 'stop_loss', 'leverage']);
        });
    }
};
