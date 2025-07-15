<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use OwenIt\Auditing\Auditable;
class Jobs extends Model implements AuditableContract
{
    use SoftDeletes;
    use Auditable;
    protected $table = 'tjobs';
    public $timestamps = true;

    protected $fillable = [
        'homeowner_id',
        'title',
        'description',
        'due_date',
        'start_date',
        'requirements',
        'end_date',
        'rate_amount',
        'rate_type',
        'performed_by',
        'placeOfAssignmentText',
        'created_by',
        'placeOfAssignment',
        'updated_by',
        'status',
        'archived',
    ];

    protected $casts = [
        'archived' => 'boolean',
    ];

    public function contract()
    {
        return $this->hasOne(Contracts::class, 'JobID', 'id');
    }


    public function favorites()
    {
        return $this->belongsToMany(User::class, 'favjob', 'JobID', 'UserID');
    }
    public function homeowner()
    {
        return $this->belongsTo(User::class, 'homeowner_id');
    }

    public function skills_required()
    {
        return $this->hasMany(JobSkill::class, 'job_id');
    }
    public function applicants()
    {
        return $this->hasMany(Bid::class, 'job_id');
    }

    public function performer()
    {
        return $this->belongsTo(User::class, 'performed_by');
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
