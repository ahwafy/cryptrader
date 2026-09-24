<?php

namespace App\Filament\Resources\Trades\Schemas;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class TradeForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('signal_id')
                    ->numeric(),
                TextInput::make('asset'),
                TextInput::make('symbol')
                    ->label('Trading Pair'),
                TextInput::make('mode')
                    ->label('Mode (Paper/Live)'),
                Select::make('trade_type')
                    ->options([
                        'spot' => 'Spot',
                        'futures' => 'Futures',
                    ]),
                Select::make('side')
                    ->options([
                        'LONG' => 'LONG',
                        'SHORT' => 'SHORT',
                    ]),
                TextInput::make('amount')
                    ->numeric(),
                TextInput::make('leverage')
                    ->numeric()
                    ->suffix('x'),
                TextInput::make('entry_price')
                    ->numeric()
                    ->prefix('$'),
                TextInput::make('exit_price')
                    ->numeric()
                    ->prefix('$'),
                TextInput::make('pnl')
                    ->label('Profit/Loss')
                    ->numeric()
                    ->prefix('$'),
                TextInput::make('target_prices')
                    ->helperText('List of target prices'),
                TextInput::make('stop_loss')
                    ->numeric()
                    ->prefix('$'),
                Select::make('status')
                    ->options([
                        'open' => 'Open',
                        'closed' => 'Closed',
                        'liquidated' => 'Liquidated',
                    ]),
                TextInput::make('outcome')
                    ->label('Outcome Reason'),
                TextInput::make('created_at')
                    ->label('Started At'),
                TextInput::make('closed_at')
                    ->label('Ended At'),
            ]);
    }
}
