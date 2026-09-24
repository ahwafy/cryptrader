<?php

namespace App\Filament\Widgets;

use App\Models\Signal;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class LatestSignalsWidget extends BaseWidget
{
    protected static ?int $sort = 4;
    protected int | string | array $columnSpan = 'full';

    public function table(Table $table): Table
    {
        return $table
            ->query(Signal::latest()->limit(5))
            ->columns([
                Tables\Columns\TextColumn::make('created_at')->dateTime()->label('Time'),
                Tables\Columns\TextColumn::make('source.name')->label('Source'),
                Tables\Columns\TextColumn::make('asset')->label('Asset'),
                Tables\Columns\TextColumn::make('parsed_sentiment')
                    ->label('Sentiment')
                    ->badge()
                    ->formatStateUsing(fn ($state) => $state > 0 ? 'Bullish' : 'Bearish')
                    ->color(fn ($state) => $state > 0 ? 'success' : 'danger'),
                Tables\Columns\TextColumn::make('status')
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'pending' => 'warning',
                        'processed' => 'success',
                        'failed' => 'danger',
                        default => 'gray',
                    }),
            ]);
    }
}
