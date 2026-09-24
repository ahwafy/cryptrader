<?php

require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$settings = App\Models\Setting::all();
foreach ($settings as $setting) {
    echo "ID: {$setting->id} | Key: {$setting->key} | Value: {$setting->value} | Description: {$setting->description}\n";
}
