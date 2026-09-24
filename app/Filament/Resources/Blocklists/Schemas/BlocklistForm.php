<?php

namespace App\Filament\Resources\Blocklists\Schemas;

use Filament\Schemas\Schema;

use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DateTimePicker;

class BlocklistForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('asset')
                    ->required()
                    ->maxLength(255),
                DateTimePicker::make('blocked_until')
                    ->label('Blocked Until (Leave empty for permanent block)'),
                TextInput::make('reason')
                    ->maxLength(255),
            ]);
    }
}
