<?php

namespace App\Filament\Pages;

use Filament\Pages\Dashboard as BaseDashboard;
use Filament\Actions\Action;

class Dashboard extends BaseDashboard
{
    protected function getHeaderActions(): array
    {
        $currentMode = session()->get('dashboard_mode', 'paper');
        $isLive = $currentMode === 'live';

        return [
            Action::make('toggleMode')
                ->label($isLive ? 'Viewing: LIVE TRADES 🔴 (Switch to Paper)' : 'Viewing: PAPER TRADES 🧪 (Switch to Live)')
                ->color($isLive ? 'danger' : 'info')
                ->button()
                ->action(function () use ($isLive) {
                    session()->put('dashboard_mode', $isLive ? 'paper' : 'live');
                    return redirect(request()->header('Referer') ?? '/admin');
                }),
        ];
    }
}
