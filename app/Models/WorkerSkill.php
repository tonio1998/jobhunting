<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use OwenIt\Auditing\Auditable;

class WorkerSkill extends Model implements AuditableContract
{
    use Auditable;
    use SoftDeletes;
    protected $table = 'worker_skills';
    public $timestamps = true;

    protected $fillable = [
        'skilled_worker_id',
        'skill_id',
        'created_by',
        'updated_by',
        'status',
        'archived',
    ];

    protected $casts = [
        'archived' => 'boolean',
    ];

    public function skill()
    {
        return $this->belongsTo(Skill::class, 'skill_id');
    }

    public function skilledWorker()
    {
        return $this->belongsTo(SkilledWorker::class, 'skilled_worker_id');
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function updater()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }
}
