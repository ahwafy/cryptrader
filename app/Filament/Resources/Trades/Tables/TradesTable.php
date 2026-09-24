<?php

namespace App\Filament\Resources\Trades\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Actions\DeleteAction;
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
                    ->weight('bold'),
                TextColumn::make('symbol')
                    ->label('Pair')
                    ->badge()
                    ->color('gray'),
                TextColumn::make('amount')
                    ->numeric()
                    ->label('Qty'),
                TextColumn::make('size_usdt')
                    ->label('Size (USDT)')
                    ->getStateUsing(fn ($record) => $record->amount && $record->entry_price ? round($record->amount * $record->entry_price, 2) : null)
                    ->money('USD')
                    ->color('info'),
                TextColumn::make('trade_type')
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'futures' => 'warning',
                        'spot' => 'success',
                        default => 'gray',
                    }),
                TextColumn::make('leverage')
                    ->suffix('x')
                    ->label('Lev'),
                TextColumn::make('entry_price')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('target_prices')
                    ->label('Targets')
                    ->limit(20),
                TextColumn::make('stop_loss')
                    ->color('danger'),
                TextColumn::make('status')
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'open' => 'info',
                        'closed' => 'success',
                        'liquidated' => 'danger',
                        default => 'gray',
                    }),
                TextColumn::make('outcome')
                    ->searchable()
                    ->badge()
                    ->color(fn (?string $state): string => 
                        str_contains($state ?? '', 'Profit') ? 'success' : 
                        (str_contains($state ?? '', 'Loss') ? 'danger' : 'gray')
                    ),
                TextColumn::make('pnl')
                    ->label('PnL')
                    ->money('USD')
                    ->sortable()
                    ->color(fn ($state) => $state > 0 ? 'success' : ($state < 0 ? 'danger' : 'gray')),
                TextColumn::make('created_at')
                    ->dateTime('Y-m-d H:i:s')
                    ->label('Started')
                    ->sortable(),
                TextColumn::make('closed_at')
                    ->dateTime('Y-m-d H:i:s')
                    ->label('Ended')
                    ->placeholder('Active...')
                    ->sortable(),
            ])
            ->defaultSort('created_at', 'desc')
            ->filters([
                //
            ])
            ->actions([
                ViewAction::make(),
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->recordAction(ViewAction::class)
            ->bulkActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
