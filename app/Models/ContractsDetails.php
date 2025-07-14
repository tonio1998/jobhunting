<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ContractsDetails extends Model
{
    protected $table = 'contract_details';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'ContractID',
        'UserID',
        'method',
        'created_by',
        'updated_by',
        'status',
        'archived',
        'created_at',
        'updated_at',
    ];
}
