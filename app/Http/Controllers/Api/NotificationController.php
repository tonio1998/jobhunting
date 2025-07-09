<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Services\FCMServiceV1;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
//    public function sendNotification(Request $request)
//    {
//        $request->validate([
//            'title' => 'required|string|max:255',
//            'body' => 'required|string|max:1000',
//            'user_id' => 'required',
//        ]);
//
//        if($request->user_id == 'all'){
//            $user = User::where('fcm_token', '!=', null)->get();
//        }else{
//            $user = User::findOrFail($request->user_id);
//        }
//
//        $token = $user->fcm_token;
//
//        if (!$token) {
//            return response()->json(['message' => 'No device token found'], 404);
//        }
//
//        $fcm = new FCMServiceV1();
//        $result = $fcm->sendToDevice(
//            $token,
//            $request->input('title'),
//            $request->input('body')
//        );
//
//        return response()->json($result);
//    }

    public function sendNotification(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'body' => 'required|string|max:1000',
            'user_id' => 'required',
            'screen' => 'nullable|nullable',
            'extra_data' => 'nullable|nullable',
        ]);

        if ($request->user_id === 'all') {
            $tokens = User::whereNotNull('fcm_token')
                ->where('role', 'skilled_worker')
                ->pluck('fcm_token')
                ->toArray();

            if (empty($tokens)) {
                return response()->json(['message' => 'No device tokens found'], 404);
            }
        } else {
            $user = User::findOrFail($request->user_id);

            if (!$user->fcm_token) {
                return response()->json(['message' => 'No device token found for this user'], 404);
            }

            $tokens = [$user->fcm_token];
        }

        $data = [];

        if ($request->filled('screen')) {
            $data['screen'] = $request->input('screen');
        }

        if ($request->filled('extra_data') && is_array($request->extra_data)) {
            $data = array_merge($data, $request->extra_data);
        }

        $fcm = new FCMServiceV1();

        foreach ($tokens as $token) {
            $fcm->sendToDevice(
                $token,
                $request->input('title'),
                $request->input('body'),
                $data
            );
        }

        return response()->json(['message' => 'Notifications sent successfully.']);
    }




}
