<?php

namespace App\Filament\Widgets;

use App\Models\Trade;
use Filament\Widgets\ChartWidget;

class TradeSuccessChart extends ChartWidget
{
    protected ?string $heading = 'Trade Success Distribution';

    protected function getData(): array
    {
        $mode = session()->get('dashboard_mode', 'paper');

        $profits = Trade::where('status', 'closed')->where('mode', $mode)->where('pnl', '>', 0)->count();
        $losses = Trade::where('status', 'closed')->where('mode', $mode)->where('pnl', '<', 0)->count();
        $breakeven = Trade::where('status', 'closed')->where('mode', $mode)->where('pnl', 0)->count();
        $active = Trade::where('status', 'open')->where('mode', $mode)->count();

        return [
            'datasets' => [
                [
                    'label' => 'Trades',
                    'data' => [$profits, $losses, $breakeven, $active],
                    'backgroundColor' => [
                        '#10b981', // green for profit
                        '#ef4444', // red for loss
                        '#94a3b8', // gray for breakeven
                        '#3b82f6'  // blue for active
                    ],
                ],
            ],
            'labels' => ['Profit', 'Loss', 'Breakeven', 'Active'],
        ];
    }

    protected function getType(): string
    {
        return 'pie';
    }
}
