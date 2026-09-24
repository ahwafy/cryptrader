<?php

namespace App\Filament\Resources\Trades\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class TradesTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('signal_id')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('asset')
                    ->searchable()
                    ->badge(),
                TextColumn::make('symbol')
                    ->label('Pair')
                    ->searchable()
                    ->badge()
                    ->color('gray'),
                TextColumn::make('entry_price')
                    ->money()
                    ->sortable(),
                TextColumn::make('amount')
                    ->label('Amount (USDT)')
                    ->money('USD')
                    ->sortable(),
                TextColumn::make('status')
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'open' => 'warning',
                        'closed' => 'success',
                        'failed' => 'danger',
                        default => 'gray',
                    })
                    ->searchable(),
                TextColumn::make('outcome')
                    ->badge()
                    ->color(fn (?string $state): string => str_contains($state ?? '', 'Profit') ? 'success' : (str_contains($state ?? '', 'Loss') ? 'danger' : 'gray'))
                    ->searchable(),
                TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                EditAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
