<?php

namespace App\Filament\Pages;

use App\Models\Setting;
use Filament\Schemas\Components\Grid;
use Filament\Schemas\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Schemas\Components\Tabs;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Schemas\Schema;
use Filament\Pages\Page;
use Filament\Notifications\Notification;

class SystemSettings extends Page implements HasForms
{
    use InteractsWithForms;

    protected static ?string $title = 'System Settings';
    protected static ?string $navigationLabel = 'System Settings';
    
    public static function getNavigationIcon(): string|\BackedEnum|null
    {
        return 'heroicon-o-cog-6-tooth';
    }
    
    protected string $view = 'filament.pages.system-settings';

    public ?array $data = [];

    public function mount(): void
    {
        // Load all settings into a key-value array
        $settings = Setting::pluck('value', 'key')->toArray();
        
        // Populate form data, converting '1'/'0' to booleans for toggles where appropriate
        $this->form->fill([
            'system_status' => $settings['system_status'] ?? 'running',
            'emergency_stop' => (bool) ($settings['emergency_stop'] ?? false),
            'trading_mode' => $settings['trading_mode'] ?? 'paper',
            'paper_trading_status' => $settings['paper_trading_status'] ?? 'active',
            'live_trading_status' => $settings['live_trading_status'] ?? 'inactive',
            'futures_trading_status' => $settings['futures_trading_status'] ?? 'inactive',
            
            'risk_per_trade' => $settings['risk_per_trade'] ?? '0.10',
            'min_notional' => $settings['min_notional'] ?? '11.0',
            'max_futures_leverage' => $settings['max_futures_leverage'] ?? '5',
            
            'atr_target_compression' => (bool) ($settings['atr_target_compression'] ?? true),
            'max_holding_hours' => $settings['max_holding_hours'] ?? '2',
            'early_profit_exit_status' => $settings['early_profit_exit_status'] ?? 'inactive',
            'early_profit_exit_hours' => $settings['early_profit_exit_hours'] ?? '1',
            
            'poll_interval' => $settings['poll_interval'] ?? '60',
            
            // Read-only heartbeats
            'last_heartbeat_executor' => $settings['last_heartbeat_executor'] ?? 'Never',
            'last_heartbeat_ingestor' => $settings['last_heartbeat_ingestor'] ?? 'Never',
            'last_heartbeat_classifier' => $settings['last_heartbeat_classifier'] ?? 'Never',
            'last_heartbeat_auditor' => $settings['last_heartbeat_auditor'] ?? 'Never',
            
            'auto_blocklist_hours' => $settings['auto_blocklist_hours'] ?? '24',
            'auto_blocklist_consecutive_losses' => $settings['auto_blocklist_consecutive_losses'] ?? '2',
            'auto_blocklist_max_loss_amount' => $settings['auto_blocklist_max_loss_amount'] ?? '50',
            
            // Smart Leverage Settings
            'smart_leverage_tier1_coins' => $settings['smart_leverage_tier1_coins'] ?? 'BTC, ETH',
            'smart_leverage_tier2_coins' => $settings['smart_leverage_tier2_coins'] ?? 'SOL, BNB, ADA, XRP, LINK, AVAX, DOT',
            'smart_leverage_tier1_base' => $settings['smart_leverage_tier1_base'] ?? '5',
            'smart_leverage_tier2_base' => $settings['smart_leverage_tier2_base'] ?? '3',
            'smart_leverage_tier3_base' => $settings['smart_leverage_tier3_base'] ?? '1',
            'smart_leverage_wr_high' => $settings['smart_leverage_wr_high'] ?? '0.80',
            'smart_leverage_wr_low' => $settings['smart_leverage_wr_low'] ?? '0.60',
        ]);
    }

    public function form(Schema $schema): Schema
    {
        return $schema
            ->components([
                Tabs::make('Settings')
                    ->tabs([
                        Tabs\Tab::make('Trading Engine Modes')
                            ->icon('heroicon-o-cpu-chip')
                            ->schema([
                                Grid::make(2)->schema([
                                    Select::make('system_status')
                                        ->label('Global System Status')
                                        ->options([
                                            'running' => 'Running',
                                            'stopped' => 'Stopped',
                                        ])
                                        ->required(),
                                    Toggle::make('emergency_stop')
                                        ->label('Emergency Stop (Halt Everything)')
                                        ->onColor('danger')
                                        ->offColor('success'),
                                ]),
                                Section::make('Trading Toggles')->schema([
                                    Grid::make(2)->schema([
                                        Select::make('trading_mode')
                                            ->label('Primary Trading Mode')
                                            ->options([
                                                'paper' => 'Paper Trading',
                                                'live' => 'Live Trading',
                                            ])->required(),
                                        Select::make('paper_trading_status')
                                            ->label('Paper Trading Enabled')
                                            ->options(['active' => 'Active', 'inactive' => 'Inactive'])
                                            ->required(),
                                        Select::make('live_trading_status')
                                            ->label('Live Spot Trading Enabled')
                                            ->options(['active' => 'Active', 'inactive' => 'Inactive'])
                                            ->required(),
                                        Select::make('futures_trading_status')
                                            ->label('Futures Trading Enabled')
                                            ->options(['active' => 'Active', 'inactive' => 'Inactive'])
                                            ->required(),
                                    ])
                                ])
                            ]),
                        
                        Tabs\Tab::make('Risk Management')
                            ->icon('heroicon-o-shield-check')
                            ->schema([
                                Grid::make(3)->schema([
                                    TextInput::make('risk_per_trade')
                                        ->label('Risk per Trade (%)')
                                        ->helperText('E.g., 0.10 for 10%')
                                        ->numeric()
                                        ->step('0.01')
                                        ->required(),
                                    TextInput::make('min_notional')
                                        ->label('Minimum Notional Size (USDT)')
                                        ->numeric()
                                        ->required(),
                                    Select::make('max_futures_leverage')
                                        ->label('Max Futures Leverage')
                                        ->options([
                                            '1' => '1x (No Leverage)',
                                            '2' => '2x',
                                            '3' => '3x',
                                            '4' => '4x',
                                            '5' => '5x (Safe Cap)',
                                            '10' => '10x',
                                            '20' => '20x',
                                        ])
                                        ->required(),
                                ]),
                                Section::make('Smart Leverage Configuration')->schema([
                                    Grid::make(2)->schema([
                                        TextInput::make('smart_leverage_tier1_coins')
                                            ->label('Tier 1 Coins (Comma separated)')
                                            ->helperText('Ultra-safe coins (e.g. BTC, ETH)')
                                            ->required(),
                                        TextInput::make('smart_leverage_tier1_base')
                                            ->label('Tier 1 Base Leverage')
                                            ->numeric()
                                            ->required(),
                                        TextInput::make('smart_leverage_tier2_coins')
                                            ->label('Tier 2 Coins (Comma separated)')
                                            ->helperText('High-Cap Bluechips (e.g. SOL, BNB, ADA)')
                                            ->required(),
                                        TextInput::make('smart_leverage_tier2_base')
                                            ->label('Tier 2 Base Leverage')
                                            ->numeric()
                                            ->required(),
                                        TextInput::make('smart_leverage_tier3_base')
                                            ->label('Tier 3 Base Leverage (Altcoins)')
                                            ->helperText('Base leverage for all unlisted coins')
                                            ->numeric()
                                            ->required(),
                                    ]),
                                    Grid::make(2)->schema([
                                        TextInput::make('smart_leverage_wr_high')
                                            ->label('High Trust Win Rate Threshold')
                                            ->helperText('Traders above this WR (e.g. 0.80) get 1.0x multiplier.')
                                            ->numeric()
                                            ->step('0.01')
                                            ->required(),
                                        TextInput::make('smart_leverage_wr_low')
                                            ->label('Low Trust Win Rate Threshold')
                                            ->helperText('Traders below this WR (e.g. 0.60) get 0.0x multiplier (forced 1x leverage).')
                                            ->numeric()
                                            ->step('0.01')
                                            ->required(),
                                    ])
                                ])
                            ]),
                            
                        Tabs\Tab::make('Asset Cooldown')
                            ->icon('heroicon-o-clock')
                            ->schema([
                                Section::make('Asset Cooldown (Auto-Blocklist)')->schema([
                                    Grid::make(3)->schema([
                                        TextInput::make('auto_blocklist_hours')
                                            ->label('Cooldown Duration (Hours)')
                                            ->helperText('How long a coin is blocked. 0 to disable.')
                                            ->numeric()
                                            ->required(),
                                        TextInput::make('auto_blocklist_consecutive_losses')
                                            ->label('Consecutive Losses Threshold')
                                            ->helperText('Auto-block if coin loses this many times in a row.')
                                            ->numeric()
                                            ->required(),
                                        TextInput::make('auto_blocklist_max_loss_amount')
                                            ->label('Max Single Loss Amount ($)')
                                            ->helperText('Auto-block immediately if a single trade loses more than this.')
                                            ->numeric()
                                            ->required(),
                                    ])
                                ])
                            ]),

                        Tabs\Tab::make('Exit Strategies')
                            ->icon('heroicon-o-arrow-right-on-rectangle')
                            ->schema([
                                Toggle::make('atr_target_compression')
                                    ->label('Enable ATR Target Compression')
                                    ->helperText('Adjusts TP dynamically based on volatility.'),
                                
                                Section::make('Time-Based Exits')->schema([
                                    Grid::make(2)->schema([
                                        TextInput::make('max_holding_hours')
                                            ->label('Max Holding Hours (Strategy 1)')
                                            ->helperText('Hours before smart-conditional time exit triggers. 0 to disable.')
                                            ->numeric()
                                            ->required(),
                                    ])
                                ]),
                                
                                Section::make('Early Profit Exits')->schema([
                                    Grid::make(2)->schema([
                                        Select::make('early_profit_exit_status')
                                            ->label('Strategy 3 Status')
                                            ->options([
                                                'inactive' => 'Inactive',
                                                'active' => 'Active (Auto-exit)',
                                                'ai_decide' => 'AI Decide (Ollama)',
                                            ])
                                            ->required(),
                                        TextInput::make('early_profit_exit_hours')
                                            ->label('Early Profit Threshold (Hours)')
                                            ->helperText('Minimum hours held before checking early profit.')
                                            ->numeric()
                                            ->required(),
                                    ])
                                ])
                            ]),

                        Tabs\Tab::make('System Config & Heartbeats')
                            ->icon('heroicon-o-server')
                            ->schema([
                                TextInput::make('poll_interval')
                                    ->label('Engine Poll Interval (Seconds)')
                                    ->numeric()
                                    ->required(),
                                Section::make('Service Heartbeats (Read-Only)')->schema([
                                    Grid::make(2)->schema([
                                        TextInput::make('last_heartbeat_executor')->disabled(),
                                        TextInput::make('last_heartbeat_ingestor')->disabled(),
                                        TextInput::make('last_heartbeat_classifier')->disabled(),
                                        TextInput::make('last_heartbeat_auditor')->disabled(),
                                    ])
                                ])
                            ]),
                    ])->columnSpanFull()
            ])
            ->statePath('data');
    }

    public function save(): void
    {
        $data = $this->form->getState();
        
        // Convert toggles back to 1/0
        $data['emergency_stop'] = $data['emergency_stop'] ? '1' : '0';
        $data['atr_target_compression'] = $data['atr_target_compression'] ? '1' : '0';

        // Loop and save each setting
        foreach ($data as $key => $value) {
            Setting::updateOrCreate(
                ['key' => $key],
                ['value' => (string) $value]
            );
        }

        Notification::make()
            ->success()
            ->title('Settings successfully saved.')
            ->send();
    }
}
