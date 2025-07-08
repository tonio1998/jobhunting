<?php

namespace App\Http\Controllers\Worklinker;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class XenditController extends Controller
{
   public function handleWebhook(Request $request)
    {
        // Just log for now, you'll see it in storage/logs/laravel.log
        Log::info('🔔 Xendit Webhook', $request->all());

        return response()->json(['message' => 'Webhook received'], 200);
    }
}
