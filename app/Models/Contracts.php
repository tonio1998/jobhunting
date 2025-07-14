<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Contracts extends Model
{
    protected $table = 'contracts';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'JobID',
        'BidID',
        'UserID',
        'created_by',
        'updated_by',
        'status',
        'archived',
        'created_at',
        'updated_at',
    ];

    public function details()
    {
        return $this->hasMany(ContractsDetails::class, 'ContractID');
    }
}
