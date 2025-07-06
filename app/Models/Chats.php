<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use OwenIt\Auditing\Contracts\Auditable as AuditableContract;
use OwenIt\Auditing\Auditable;
class Chats extends Model implements AuditableContract
{
    use SoftDeletes; use Auditable;

    protected $table = 'messages';

    protected $fillable = [
        'sender_id',
        'receiver_id',
        'from',
        'conversation_id',
        'message',
        'attachment_url',
        'attachment_type',
        'is_read',
    ];
}
