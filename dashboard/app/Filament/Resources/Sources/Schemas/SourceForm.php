<?php

namespace App\Filament\Resources\Sources\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class SourceForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('name')
                    ->required(),
                \Filament\Forms\Components\Select::make('type')
                    ->options([
                        'rss' => 'RSS News',
                        'telegram' => 'Telegram Signal',
                        'manual' => 'Manual Input',
                    ])
                    ->required(),
                \Filament\Forms\Components\Select::make('status')
                    ->options([
                        'active' => 'Active',
                        'inactive' => 'Inactive',
                    ])
                    ->required()
                    ->default('active'),
                TextInput::make('historical_win_rate')
                    ->label('Win Rate (0.0 - 1.0)')
                    ->required()
                    ->numeric()
                    ->step(0.01)
                    ->default(0),
            ]);
    }
}
