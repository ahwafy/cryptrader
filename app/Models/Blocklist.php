<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Blocklist extends Model
{
    protected $table = 'blocklist';
    
    protected $fillable = [
        'asset',
        'blocked_until',
        'reason',
    ];

    protected $casts = [
        'blocked_until' => 'datetime',
    ];
}
