<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use OwenIt\Auditing\Auditable;
class SkilledWorker extends Model implements AuditableContract
{
    use Auditable;
    use SoftDeletes;
    protected $table = 'skilled_workers';
    public $timestamps = true;

    protected $fillable = [
        'user_id',
        'rating',
        'description',
        'created_by',
        'updated_by',
        'status',
        'archived',
    ];

    protected $casts = [
        'rating' => 'decimal:2',
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

    public function skills()
    {
        return $this->hasMany(WorkerSkill::class, 'skilled_worker_id');
    }
}
