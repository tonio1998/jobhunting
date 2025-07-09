<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Services\FCMServiceV1;
use Illuminate\Http\Request;

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
        ]);

        if ($request->user_id == 'all') {
            // Get all users with a non-null FCM token
            $users = User::whereNotNull('fcm_token')->pluck('fcm_token')->toArray();
            if (empty($users)) {
                return response()->json(['message' => 'No device tokens found'], 404);
            }
            $tokens = $users;
        } else {
            $user = User::findOrFail($request->user_id);

            if (!$user->fcm_token) {
                return response()->json(['message' => 'No device token found for this user'], 404);
            }

            $tokens = [$user->fcm_token];
        }

        $fcm = new FCMServiceV1();

        foreach ($tokens as $token) {
            $result = $fcm->sendToDevice(
                $token,
                $request->input('title'),
                $request->input('body')
            );

            return response()->json($result);
        }
    }

}
