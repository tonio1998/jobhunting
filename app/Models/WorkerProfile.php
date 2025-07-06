<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WorkerProfile extends Model
{
    protected $table = 'worker_profile';

    protected $fillable = [
        'UserID',
        'email',
        'phone_number',
        'skills',
        'personal_info',
        'requirements',
        'points'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
