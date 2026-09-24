<?php

namespace App\Filament\Resources\Blocklists;

use App\Filament\Resources\Blocklists\Pages\CreateBlocklist;
use App\Filament\Resources\Blocklists\Pages\EditBlocklist;
use App\Filament\Resources\Blocklists\Pages\ListBlocklists;
use App\Filament\Resources\Blocklists\Schemas\BlocklistForm;
use App\Filament\Resources\Blocklists\Tables\BlocklistsTable;
use App\Models\Blocklist;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class BlocklistResource extends Resource
{
    protected static ?string $model = Blocklist::class;
    
    protected static ?string $navigationGroup = 'Risk Management';
    protected static ?string $navigationLabel = 'Blocklists';

    public static function getNavigationIcon(): string|\BackedEnum|null
    {
        return 'heroicon-o-rectangle-stack';
    }

    public static function form(Schema $schema): Schema
    {
        return BlocklistForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return BlocklistsTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListBlocklists::route('/'),
            'create' => CreateBlocklist::route('/create'),
            'edit' => EditBlocklist::route('/{record}/edit'),
        ];
    }
}
