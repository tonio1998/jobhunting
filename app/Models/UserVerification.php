<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserVerification extends Model
{
    protected $table = 'user_verification';
    public $timestamps = false;

    protected $fillable = [
        'UserID',
        'isValidated',
        'DateValidated',
        'ValidatedBy',
    ];
}
