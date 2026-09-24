<?php

namespace App\Filament\Resources\Sources\Schemas;

use Filament\Forms\Components\Select;
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
                Select::make('type')
                    ->options([
                        'telegram' => 'Telegram',
                        'twitter' => 'Twitter',
                        'news' => 'News/Web',
                        'api' => 'API / Exchange',
                        'binance_copy' => 'Binance Copy',
                    ])
                    ->required(),
                Select::make('status')
                    ->options([
                        'active' => 'Active',
                        'inactive' => 'Inactive',
                        'paused' => 'Paused',
                        'failed' => 'Failed',
                    ])
                    ->required()
                    ->default('active'),
                TextInput::make('historical_win_rate')
                    ->required()
                    ->numeric()
                    ->default(0),
                TextInput::make('catch_up_hours')
                    ->required()
                    ->numeric()
                    ->default(0),
            ]);
    }
}
