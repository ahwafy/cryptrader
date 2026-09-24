<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Signal extends Model
{
    protected $guarded = [];

    public function source()
    {
        return $this->belongsTo(Source::class);
    }
}
