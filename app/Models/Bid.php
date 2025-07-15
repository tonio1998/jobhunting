<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use OwenIt\Auditing\Auditable;

class Bid extends Model implements AuditableContract
{
    use SoftDeletes;
    use Auditable;

    protected $table = 'bids';
    public $timestamps = true;

    protected $fillable = [
        'job_id',
        'skilled_worker_id',
        'price',
        'description',
        'total_pay',
        'created_by',
        'updated_by',
        'status',
        'archived',
    ];

    protected $casts = [
        'price' => 'decimal:2',
        'archived' => 'boolean',
    ];

    // Relationships
    public function job()
    {
        return $this->belongsTo(Jobs::class, 'job_id');
    }


    public function skilledWorker()
    {
        return $this->belongsTo(SkilledWorker::class, 'UserID');
    }


    public function details()
    {
        return $this->belongsTo(User::class, 'UserID');
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
