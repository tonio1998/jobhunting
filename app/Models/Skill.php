<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use OwenIt\Auditing\Auditable;
class Skill extends Model implements AuditableContract
{
    use SoftDeletes;
    use Auditable;
    protected $table = 'skills';
    public $timestamps = true;

    protected $fillable = [
        'description',
        'created_by',
        'updated_by',
        'status',
        'archived',
    ];

    protected $casts = [
        'archived' => 'boolean',
    ];

    // Relationships (optional)
    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function updater()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }

    public function workerSkills()
    {
        return $this->hasMany(WorkerSkill::class, 'skill_id');
    }
}
