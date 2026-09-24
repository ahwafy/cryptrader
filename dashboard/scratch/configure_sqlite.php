<?php

require __DIR__ . '/../vendor/autoload.php';
$app = require_once __DIR__ . '/../bootstrap/app.php';

use Illuminate\Support\Facades\DB;

$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

try {
    echo "Connecting to database...\n";
    $dbPath = config('database.connections.sqlite.database');
    echo "Database Path: " . $dbPath . "\n";
    
    if (!file_exists($dbPath)) {
        die("Error: Database file does not exist.\n");
    }

    // Check current journal mode
    $currentJournal = DB::select("PRAGMA journal_mode;");
    echo "Current Journal Mode: " . json_encode($currentJournal) . "\n";
    
    $currentSynchronous = DB::select("PRAGMA synchronous;");
    echo "Current Synchronous: " . json_encode($currentSynchronous) . "\n";

    echo "Setting journal_mode to WAL...\n";
    DB::statement("PRAGMA journal_mode=WAL;");
    
    echo "Setting synchronous to NORMAL...\n";
    DB::statement("PRAGMA synchronous=NORMAL;");

    $newJournal = DB::select("PRAGMA journal_mode;");
    echo "New Journal Mode: " . json_encode($newJournal) . "\n";
    
    $newSynchronous = DB::select("PRAGMA synchronous;");
    echo "New Synchronous: " . json_encode($newSynchronous) . "\n";
    
    echo "SQLite configured successfully!\n";
} catch (\Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
