<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use Illuminate\Support\Facades\File;

class AiTerminals extends Page
{
    protected string $view = 'filament.pages.ai-terminals';

    protected static string | \BackedEnum | null $navigationIcon = 'heroicon-o-command-line';
    protected static ?string $navigationLabel = 'AI Terminals';
    protected static ?string $title = 'Live AI Engine Terminals';
    protected static string | \UnitEnum | null $navigationGroup = 'System Management';


    public function getLogsProperty(): array
    {
        $logDir = base_path('ai_workers');
        $files = [
            'executor' => 'executor.log',
            'auditor' => 'auditor.log',
            'ingestor' => 'ingestor.log',
            'telegram' => 'telegram.log',
            'classifier' => 'classifier.log',
            'onchain' => 'onchain.log',
            'cmc' => 'cmc_monitor.log',
            'backup' => 'backup_manager.log',
            'binance_copy' => 'copy_monitor.log',
        ];

        $logs = [];
        foreach ($files as $key => $filename) {
            $path = $logDir . '/' . $filename;
            if (File::exists($path)) {
                $lines = $this->tailFile($path, 150);
                $logs[$key] = implode("\n", $lines);
            } else {
                $logs[$key] = "Log file not found: {$filename}\nWaiting for engine to start...";
            }
        }
        return $logs;
    }

    private function tailFile($filepath, $lines = 150)
    {
        $f = @fopen($filepath, "rb");
        if ($f === false) return [];

        fseek($f, -1, SEEK_END);
        if (fread($f, 1) != "\n") $lines -= 1;
        
        $output = '';
        $chunklen = 4096;
        while (ftell($f) > 0 && $lines >= 0) {
            $seek = min(ftell($f), $chunklen);
            fseek($f, -$seek, SEEK_CUR);
            $output = ($chunk = fread($f, $seek)) . $output;
            fseek($f, -mb_strlen($chunk, '8bit'), SEEK_CUR);
            $lines -= substr_count($chunk, "\n");
        }
        
        while ($lines++ < 0) {
            $output = substr($output, strpos($output, "\n") + 1);
        }
        fclose($f);
        return explode("\n", trim($output));
    }
}
