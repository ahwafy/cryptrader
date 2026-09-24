<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Seeder;

class SettingSeeder extends Seeder
{
    public function run(): void
    {
        $settings = [
            [
                'key' => 'risk_per_trade',
                'value' => '0.10',
                'description' => 'Percentage of balance to risk per trade (0.10 = 10%)',
            ],
            [
                'key' => 'min_notional',
                'value' => '11.0',
                'description' => 'Minimum order size in USDT',
            ],
            [
                'key' => 'poll_interval',
                'value' => '60',
                'description' => 'Seconds to wait between AI processing cycles',
            ],
            [
                'key' => 'system_status',
                'value' => 'running',
                'description' => 'Global system operation status (running/stopped)',
            ],
            [
                'key' => 'emergency_stop',
                'value' => '0',
                'description' => '1 = Stop all trading immediately, 0 = Normal operation',
            ],
            [
                'key' => 'last_heartbeat_executor',
                'value' => now()->toDateTimeString(),
                'description' => 'Last time the execution engine checked in',
            ],
            [
                'key' => 'last_heartbeat_monitor',
                'value' => now()->toDateTimeString(),
                'description' => 'Last time the trade monitor engine checked in',
            ],
            [
                'key' => 'last_heartbeat_classifier',
                'value' => now()->toDateTimeString(),
                'description' => 'Last time the classifier engine checked in',
            ],
            [
                'key' => 'last_heartbeat_ingestor',
                'value' => now()->toDateTimeString(),
                'description' => 'Last time the ingestion engine checked in',
            ],
            [
                'key' => 'early_profit_exit_status',
                'value' => 'inactive',
                'description' => 'Early profit exit strategy status (active/ai_decide/inactive)',
            ],
            [
                'key' => 'early_profit_exit_hours',
                'value' => '1',
                'description' => 'Threshold hours to wait before triggering early profit exit',
            ],
            [
                'key' => 'max_holding_hours',
                'value' => '24',
                'description' => 'Maximum hours to hold an open trade before auto-closing',
            ],
        ];

        foreach ($settings as $setting) {
            Setting::updateOrCreate(['key' => $setting['key']], $setting);
        }
    }
}
