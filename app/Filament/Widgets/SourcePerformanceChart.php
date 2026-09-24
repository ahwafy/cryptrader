<?php

namespace App\Filament\Widgets;

use App\Models\Source;
use App\Models\Signal;
use Filament\Widgets\ChartWidget;

class SourcePerformanceChart extends ChartWidget
{
    protected ?string $heading = 'Source Activity (Last 100 Signals)';

    protected function getData(): array
    {
        $sources = Source::withCount('signals')
            ->orderBy('signals_count', 'desc')
            ->limit(5)
            ->get();

        return [
            'datasets' => [
                [
                    'label' => 'Signals Generated',
                    'data' => $sources->pluck('signals_count')->toArray(),
                    'backgroundColor' => '#6366f1',
                ],
            ],
            'labels' => $sources->pluck('name')->toArray(),
        ];
    }

    protected function getType(): string
    {
        return 'bar';
    }
}
