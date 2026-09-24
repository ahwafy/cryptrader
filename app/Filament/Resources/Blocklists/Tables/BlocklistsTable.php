<?php

namespace App\Filament\Resources\Blocklists\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\DeleteAction;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;

class BlocklistsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('asset')->searchable()->sortable(),
                TextColumn::make('blocked_until')
                    ->dateTime()
                    ->sortable()
                    ->description(fn ($record) => $record->blocked_until ? null : 'Blocked Forever'),
                TextColumn::make('reason')->searchable(),
                TextColumn::make('created_at')->dateTime()->sortable()->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                EditAction::make(),
                DeleteAction::make()->label('Unblock'),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make()->label('Unblock Selected'),
                ]),
            ]);
    }
}
