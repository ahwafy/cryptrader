<?php

namespace App\Filament\Resources\Signals\Schemas;

use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Schema;

class SignalForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('source_id')
                    ->required()
                    ->numeric(),
                Textarea::make('raw_text')
                    ->required()
                    ->columnSpanFull(),
                TextInput::make('parsed_sentiment')
                    ->numeric(),
                TextInput::make('asset'),
                DateTimePicker::make('timestamp')
                    ->required(),
            ]);
    }
}
