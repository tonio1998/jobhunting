<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JobFavorite extends Model
{
    protected $table = 'favjob';
    public $timestamps = false;

    protected $fillable = [
        'JobID',
        'UserID',
    ];
}
