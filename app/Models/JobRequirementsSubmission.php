<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use OwenIt\Auditing\Auditable;
class JobRequirementsSubmission extends Model implements AuditableContract
{
    use Auditable;
    
    protected $table = 'job_requirements';
    public $timestamps = true;

    protected $fillable = [
        'JobID',
        'UserID',
        'AttachmentID',
        'RequirementID',
        'FilePath',
        'created_by',
        'updated_by',
    ];

    public function attachment()
    {
        return $this->belongsTo(Requirement::class, 'AttachmentID');
    }

    public function fileDetails()
    {
        return $this->hasOne(Requirement::class, 'id', 'RequirementID');
    }
}
