<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Otp extends Model
{
    protected $table = 'otp';
    public $timestamps = true;

    protected $fillable = [
        'phone',
        'otp',
        'type',
        'expires_at',
        'created_by',
        'updated_by',
        'status',
        'archived',
    ];

}
