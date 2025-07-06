<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use OwenIt\Auditing\Auditable;

class Homeowner extends Model implements AuditableContract
{
    use SoftDeletes;
    use Auditable;
    protected $table = 'homeowners';
    public $timestamps = true;

    protected $fillable = [
        'user_id',
        'address',
        'created_by',
        'updated_by',
        'status',
        'archived',
    ];

    protected $casts = [
        'archived' => 'boolean',
    ];

    // Relationships (optional)
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function updater()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }

    public function jobs()
    {
        return $this->hasMany(Tjob::class, 'homeowner_id');
    }
}
