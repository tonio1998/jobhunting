<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use OwenIt\Auditing\Auditable;
class WorkerAttachments extends Model implements AuditableContract
{
    use Auditable;
    protected $table = 'worker_attachments';
    public $timestamps = true;

    protected $fillable = [
        'RequirementID',
        'UserID',
        'FilePath',
        'created_by',
        'updated_by',
    ];

    public function worker()
    {
        return $this->belongsTo(Workers::class, 'worker_id');
    }

    public function attachment()
    {
        return $this->belongsTo(Requirement::class, 'attachment_id');
    }

    public function fileDetails()
    {
        return $this->hasOne(Requirement::class, 'id', 'RequirementID');
    }
}
