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
        'BidID',
        'UserID',
        'method',
        'otp',
        'created_by',
        'updated_by',
        'status',
        'archived',
        'created_at',
        'updated_at',
    ];

    public function bid()
    {
        return $this->belongsTo(Bid::class, 'BidID');
    }

    public function contract()
    {
        return $this->belongsTo(Contracts::class, 'ContractID');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'UserID');
    }
}
