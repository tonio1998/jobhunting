<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use OwenIt\Auditing\Auditable;
class Review extends Model implements AuditableContract
{
    use Auditable;
    use SoftDeletes;
    protected $table = 'reviews';
    public $timestamps = true;

    protected $fillable = [
        'job_id',
        'skill_id',
        'reviewer_id',
        'created_by',
        'updated_by',
        'status',
        'archived',
    ];

    protected $casts = [
        'archived' => 'boolean',
    ];

    // Relationships (optional)

    public function job()
    {
        return $this->belongsTo(Jobs::class, 'job_id');
    }

    public function skill()
    {
        return $this->belongsTo(Skill::class, 'skill_id');
    }

    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function reviewer()
    {
        return $this->belongsTo(User::class, 'reviewer_id');
    }

    public function updater()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }
}
