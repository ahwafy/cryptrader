<?php

namespace App\Filament\Resources\Trades\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class TradeForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('signal_id')
                    ->required()
                    ->numeric(),
                TextInput::make('asset')
                    ->required(),
                TextInput::make('entry_price')
                    ->numeric()
                    ->prefix('$'),
                \Filament\Forms\Components\Select::make('status')
                    ->options([
                        'open' => 'Open',
                        'closed' => 'Closed',
                        'failed' => 'Failed',
                    ])
                    ->required()
                    ->default('open'),
                TextInput::make('outcome'),
            ]);
    }
}
