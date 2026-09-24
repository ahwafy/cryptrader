<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends StatsOverviewWidget
{
    protected function getStats(): array
    {
        $activeTrades = \App\Models\Trade::where('status', 'open')->count();
        $pendingSignals = \App\Models\Signal::where('status', 'pending')->count();
        
        $totalClosed = \App\Models\Trade::where('status', 'closed')->count();
        $wins = \App\Models\Trade::where('status', 'closed')->where('pnl', '>', 0)->count();
        $losses = \App\Models\Trade::where('status', 'closed')->where('pnl', '<', 0)->count();
        
        $totalProfit = \App\Models\Trade::where('status', 'closed')->where('pnl', '>', 0)->sum('pnl');
        $totalLoss = \App\Models\Trade::where('status', 'closed')->where('pnl', '<', 0)->sum('pnl');
        $netPnL = $totalProfit + $totalLoss;
        
        $winRate = $totalClosed > 0 ? round(($wins / $totalClosed) * 100, 1) : 0;
        $profitFactor = abs($totalLoss) > 0 ? round($totalProfit / abs($totalLoss), 2) : $totalProfit;

        $startingBalance = 100.00;
        $currentBalanceRaw = \App\Models\Setting::where('key', 'paper_usdt_balance')->value('value');
        $currentBalance = $currentBalanceRaw ? (float)$currentBalanceRaw : $startingBalance;

        $sysStatus = \App\Models\Setting::where('key', 'system_status')->value('value') ?? 'running';
        $emergStop = \App\Models\Setting::where('key', 'emergency_stop')->value('value') ?? '0';
        
        $isEmergency = $emergStop === '1';
        $isStopped = $sysStatus === 'stopped';

        return [
            Stat::make('Starting Balance', '$' . number_format($startingBalance, 2))
                ->description('Initial Paper Capital')
                ->descriptionIcon('heroicon-m-banknotes')
                ->color('gray'),
                
            Stat::make('Current Balance', '$' . number_format($currentBalance, 2))
                ->description('Total Available Equity')
                ->descriptionIcon('heroicon-m-wallet')
                ->color($currentBalance >= $startingBalance ? 'success' : 'danger'),
                
            Stat::make('Net Profit/Loss', '$' . number_format($netPnL, 2))
                ->description('Total realized PnL')
                ->descriptionIcon($netPnL >= 0 ? 'heroicon-m-arrow-trending-up' : 'heroicon-m-arrow-trending-down')
                ->color($netPnL >= 0 ? 'success' : 'danger'),
                
            Stat::make('System State', $isEmergency ? 'EMERGENCY STOP' : ($isStopped ? 'STOPPED' : 'RUNNING'))
                ->description($isEmergency ? 'All trades and engines frozen' : ($isStopped ? 'Engines paused' : 'System healthy'))
                ->descriptionIcon($isEmergency ? 'heroicon-m-no-symbol' : ($isStopped ? 'heroicon-m-pause-circle' : 'heroicon-m-play-circle'))
                ->color($isEmergency ? 'danger' : ($isStopped ? 'warning' : 'success')),

            Stat::make('Active Trades', $activeTrades)
                ->description('Currently open in market')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success'),
            Stat::make('Win Rate', $winRate . '%')
                ->description($wins . ' wins vs ' . $losses . ' losses')
                ->descriptionIcon('heroicon-m-check-badge')
                ->color($winRate >= 50 ? 'success' : 'danger'),
                
            Stat::make('Win Rate', $winRate . '%')
                ->description($wins . ' wins vs ' . $losses . ' losses')
                ->descriptionIcon('heroicon-m-check-badge')
                ->color($winRate >= 50 ? 'success' : 'danger'),

            Stat::make('Total Loss', '$' . number_format(abs($totalLoss), 2))
                ->description('Capital lost on bad trades')
                ->descriptionIcon('heroicon-m-minus-circle')
                ->color('danger'),

            Stat::make('Profit Factor', $profitFactor)
                ->description('Gross Profit / Gross Loss')
                ->descriptionIcon('heroicon-m-scale')
                ->color($profitFactor >= 1.5 ? 'success' : ($profitFactor >= 1.0 ? 'warning' : 'danger')),
                
            Stat::make('Pending Signals', $pendingSignals)
                ->description('Awaiting AI processing')
                ->descriptionIcon('heroicon-m-signal')
                ->color($pendingSignals > 0 ? 'warning' : 'gray'),
            
            Stat::make('Classifier Engine', $this->getSystemStatus('classifier'))
                ->description('Last Heartbeat: ' . $this->getHeartbeat('classifier'))
                ->descriptionIcon('heroicon-m-funnel')
                ->color($this->isSystemOnline('classifier') ? 'success' : 'danger'),
                
            Stat::make('Signals Engine', $this->getSystemStatus('executor'))
                ->description('Last Heartbeat: ' . $this->getHeartbeat('executor'))
                ->descriptionIcon('heroicon-m-cpu-chip')
                ->color($this->isSystemOnline('executor') ? 'success' : 'danger'),
                
            Stat::make('Exits Monitor', $this->getSystemStatus('monitor'))
                ->description('Last Heartbeat: ' . $this->getHeartbeat('monitor'))
                ->descriptionIcon('heroicon-m-eye')
                ->color($this->isSystemOnline('monitor') ? 'success' : 'danger'),
            
            Stat::make('Ingestion Engine', $this->getSystemStatus('ingestor'))
                ->description('Last Heartbeat: ' . $this->getHeartbeat('ingestor'))
                ->descriptionIcon('heroicon-m-bolt')
                ->color($this->isSystemOnline('ingestor') ? 'success' : 'danger'),
                
            Stat::make('Auditor Engine', $this->getSystemStatus('auditor'))
                ->description('Last Heartbeat: ' . $this->getHeartbeat('auditor'))
                ->descriptionIcon('heroicon-m-shield-check')
                ->color($this->isSystemOnline('auditor') ? 'success' : 'danger'),
                
            Stat::make('CMC Market Ingestor', $this->getSystemStatus('cmc'))
                ->description('Last Heartbeat: ' . $this->getHeartbeat('cmc'))
                ->descriptionIcon('heroicon-m-globe-alt')
                ->color($this->isSystemOnline('cmc') ? 'success' : 'danger'),
                
            Stat::make('On-Chain Monitor', $this->getSystemStatus('onchain'))
                ->description('Last Heartbeat: ' . $this->getHeartbeat('onchain'))
                ->descriptionIcon('heroicon-m-link')
                ->color($this->isSystemOnline('onchain') ? 'success' : 'danger'),
        ];
    }

    protected function getSystemStatus(string $system): string
    {
        return $this->isSystemOnline($system) ? 'ONLINE' : 'OFFLINE';
    }

    protected function getHeartbeat(string $system): string
    {
        $setting = \App\Models\Setting::where('key', "last_heartbeat_{$system}")->first();
        if (!$setting || empty($setting->value)) return 'Never';
        
        return \Carbon\Carbon::parse($setting->value, 'UTC')->diffForHumans();
    }

    protected function isSystemOnline(string $system): bool
    {
        $setting = \App\Models\Setting::where('key', "last_heartbeat_{$system}")->first();
        if (!$setting || empty($setting->value)) return false;
        
        return \Carbon\Carbon::parse($setting->value, 'UTC')->gt(now()->subMinutes(5));
    }
}
