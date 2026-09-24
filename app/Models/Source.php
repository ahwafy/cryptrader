<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Source extends Model
{
    protected $guarded = [];

    public function signals()
    {
        return $this->hasMany(Signal::class);
    }
}
