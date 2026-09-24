<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use App\Models\Trade;
use App\Models\Signal;
use App\Models\Setting;
use Carbon\Carbon;

class StatsOverview extends StatsOverviewWidget
{
    protected static ?int $sort = 1;
    protected int | string | array $columnSpan = 'full';

    protected function getColumns(): int
    {
        return 4;
    }

    protected function getStats(): array
    {
        $mode = session()->get('dashboard_mode', 'paper');

        $activeTrades = Trade::where('status', 'open')->where('mode', $mode)->count();
        $pendingSignals = Signal::where('status', 'pending')->count();
        
        $totalClosed = Trade::where('status', 'closed')->where('mode', $mode)->count();
        $wins = Trade::where('status', 'closed')->where('mode', $mode)->where('pnl', '>', 0)->count();
        $losses = Trade::where('status', 'closed')->where('mode', $mode)->where('pnl', '<', 0)->count();
        
        $totalProfit = Trade::where('status', 'closed')->where('mode', $mode)->where('pnl', '>', 0)->sum('pnl');
        $totalLoss = Trade::where('status', 'closed')->where('mode', $mode)->where('pnl', '<', 0)->sum('pnl');
        $netPnL = $totalProfit + $totalLoss;
        
        $winRate = $totalClosed > 0 ? round(($wins / $totalClosed) * 100, 1) : 0;
        $profitFactor = abs($totalLoss) > 0 ? round($totalProfit / abs($totalLoss), 2) : $totalProfit;

        // Sparkline array for Net PnL chart
        $recentPnL = Trade::where('status', 'closed')->where('mode', $mode)->orderBy('id', 'desc')->take(15)->pluck('pnl')->toArray();
        $pnlChart = empty($recentPnL) ? [0, 0] : array_reverse($recentPnL);

        // System State
        $sysStatus = Setting::where('key', 'system_status')->value('value') ?? 'running';
        $emergStop = Setting::where('key', 'emergency_stop')->value('value') ?? '0';
        $isEmergency = $emergStop === '1';
        $isStopped = $sysStatus === 'stopped';

        // Portfolio Balance
        $startingBalance = 100.00; // Initial capital
        $currentBalance = (float) (Setting::where('key', 'paper_usdt_balance')->value('value') ?? $startingBalance);
        $totalPnlAll = Trade::where('status', 'closed')->where('mode', $mode)->sum('pnl');
        $roiPercent = $startingBalance > 0 ? round(($totalPnlAll / $startingBalance) * 100, 2) : 0;

        return [
            // --- Row 1: Portfolio Balance ---
            Stat::make('Starting Balance', '$' . number_format($startingBalance, 2))
                ->description('Initial trading capital')
                ->descriptionIcon('heroicon-m-banknotes')
                ->color('gray'),

            Stat::make('Current Profit', '$' . number_format($totalPnlAll, 2))
                ->description('ROI: ' . $roiPercent . '%')
                ->descriptionIcon($totalPnlAll >= 0 ? 'heroicon-m-arrow-trending-up' : 'heroicon-m-arrow-trending-down')
                ->color($totalPnlAll >= 0 ? 'success' : 'danger')
                ->chart($pnlChart),

            Stat::make('Total Balance', '$' . number_format($currentBalance, 2))
                ->description('Starting + Realized PnL')
                ->descriptionIcon('heroicon-m-wallet')
                ->color('info'),

            // --- Row 2: High Level State & Core PnL ---
            Stat::make('System State', $isEmergency ? 'EMERGENCY STOP' : ($isStopped ? 'STOPPED' : 'RUNNING'))
                ->description($isEmergency ? 'All trading engines frozen' : ($isStopped ? 'Engines paused safely' : 'System healthy & active'))
                ->descriptionIcon($isEmergency ? 'heroicon-m-exclamation-triangle' : ($isStopped ? 'heroicon-m-pause-circle' : 'heroicon-m-play-circle'))
                ->color($isEmergency ? 'danger' : ($isStopped ? 'warning' : 'success')),

            Stat::make('Net Profit/Loss', '$' . number_format($netPnL, 2))
                ->description('Total realized PnL (Historical)')
                ->descriptionIcon($netPnL >= 0 ? 'heroicon-m-arrow-trending-up' : 'heroicon-m-arrow-trending-down')
                ->color($netPnL >= 0 ? 'success' : 'danger'),

            Stat::make('Win Rate', $winRate . '%')
                ->description("{$wins} W | {$losses} L out of {$totalClosed}")
                ->descriptionIcon('heroicon-m-trophy')
                ->color($winRate >= 50 ? 'success' : 'danger'),

            Stat::make('Profit Factor', $profitFactor)
                ->description('Gross Profit / Gross Loss')
                ->descriptionIcon('heroicon-m-scale')
                ->color($profitFactor >= 1.5 ? 'success' : ($profitFactor >= 1.0 ? 'warning' : 'danger')),

            // --- Row 2: Operational Stats ---
            Stat::make('Active Trades', $activeTrades)
                ->description('Currently open in market')
                ->descriptionIcon('heroicon-m-briefcase')
                ->color('info'),

            Stat::make('Total Loss', '-$' . number_format(abs($totalLoss), 2))
                ->description('Capital lost on bad trades')
                ->descriptionIcon('heroicon-m-banknotes')
                ->color('danger'),
                
            Stat::make('Total Closed Trades', $totalClosed)
                ->description('Total historical completed trades')
                ->descriptionIcon('heroicon-m-clipboard-document-check')
                ->color('gray'),

            Stat::make('Pending Signals', $pendingSignals)
                ->description('Awaiting AI processing')
                ->descriptionIcon('heroicon-m-signal')
                ->color($pendingSignals > 0 ? 'warning' : 'success'),
            
            // --- Row 3: Heartbeats ---
            Stat::make('Classifier Engine', $this->getSystemStatus('classifier'))
                ->description('Last: ' . $this->getHeartbeat('classifier'))
                ->descriptionIcon('heroicon-m-funnel')
                ->color($this->isSystemOnline('classifier') ? 'success' : 'danger'),
                
            Stat::make('Signals Engine', $this->getSystemStatus('executor'))
                ->description('Last: ' . $this->getHeartbeat('executor'))
                ->descriptionIcon('heroicon-m-cpu-chip')
                ->color($this->isSystemOnline('executor') ? 'success' : 'danger'),
                
            Stat::make('Exits Monitor', $this->getSystemStatus('monitor'))
                ->description('Last: ' . $this->getHeartbeat('monitor'))
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
        $setting = Setting::where('key', "last_heartbeat_{$system}")->first();
        if (!$setting || empty($setting->value)) return 'Never';
        
        return Carbon::parse($setting->value, 'UTC')->diffForHumans();
    }

    protected function isSystemOnline(string $system): bool
    {
        $setting = Setting::where('key', "last_heartbeat_{$system}")->first();
        if (!$setting || empty($setting->value)) return false;
        
        return Carbon::parse($setting->value, 'UTC')->gt(now()->subMinutes(5));
    }
}
