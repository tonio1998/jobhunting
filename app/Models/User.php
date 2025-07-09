<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, HasApiTokens;
    use HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'current_location',
        'phone_number',
        'role',
        'avatar',
        'profile_pic',
        'isVerified',
        'fcm_token'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function getInfoAttribute()
    {
        if ($this->role === 'homeowner') {
            return $this->hasOne(Homeowner::class, 'user_id')->first();
        } elseif ($this->role === 'worker') {
            return $this->hasOne(Workers::class, 'UserID')->first();
        }

        return null;
    }

    public function profile(){
        return $this->hasOne(WorkerProfile::class, 'UserID');
    }

    public function earnings(){
        return $this->hasMany(Payment::class, 'user_id', 'id');
    }

    public function info()
    {
        return $this->role === 'homeowner'
            ? $this->hasOne(Homeowner::class, 'user_id')
            : $this->hasOne(Workers::class, 'UserID');
    }

    public function jobs(){
        return $this->hasMany(Jobs::class, 'homeowner_id');
    }

    public function skills(){
        return $this->hasMany(WorkerSkill::class, 'UserID');
    }

    public function files(){
        return $this->hasMany(WorkerAttachments::class, 'UserID');
    }

    public function rating(){
        return $this->hasOne(SkilledWorker::class, 'user_id');
    }

    public function bids(){
        return $this->hasMany(Bid::class, 'UserID');
    }
}
