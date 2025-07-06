<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use OwenIt\Auditing\Auditable;
class Workers extends Model implements AuditableContract
{
    use SoftDeletes;
    use Auditable;
    protected $table = 'workers';
    public $timestamps = true;

    protected $fillable = [
        'fullName',
        'nickname',
        'dob',
        'age',
        'gender',
        'civilStatus',
        'education',
        'skills',
        'otherSkill',
        'position',
        'startImmediately',
        'assignOutsideBarangay',
        'created_by',
        'updated_by',
        'status',
        'archived',
    ];

}
