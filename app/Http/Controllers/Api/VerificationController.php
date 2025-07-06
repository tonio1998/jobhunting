<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Otp;
use App\Models\User;
use App\Models\WorkerProfile;
use App\Traits\TCommonFunctions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

class VerificationController extends Controller
{
    use TCommonFunctions;
    public function VerifyverifyOTP(Request $request)
    {
        $request->validate([
            'phone' => 'required',
            'otp' => 'required',
            'type' => 'nullable|string',
            'user_id' => 'nullable|numeric'
        ]);

        $record = Otp::where('phone', $request->phone)
            ->where('otp', $request->otp)
            ->where('type', $request->type)
            ->first();

        if ($record && strtotime($record->expires_at) > strtotime(now())) {
            $user = User::find($request->user_id);

            if ($request->type == 'change-number') {
                $isTaken = User::where('phone_number', $request->phone)
                    ->where('id', '!=', $request->user_id)
                    ->exists();

                if ($isTaken) {
                    return response()->json([
                        'success' => false,
                        'message' => 'The number is already taken.',
                    ]);
                }

                $user->phone_number = $request->phone;
                $user->save();

                WorkerProfile::updateOrCreate(
                    ['UserID' => $user->id],
                    ['phone_number' => 1]
                );
            }

            $record->delete();

            return response()->json(['success' => true]);
        }

        return response()->json([
            'success' => false,
            'message' => 'OTP invalid or expired.',
        ]);
    }


    public function VerifysendOTP(Request $request)
    {
        $request->validate([
            'phone' => [
                'required',
                function ($attribute, $value, $fail) use ($request) {
                    if ($request->type === 'change-number') {
                        $exists = \App\Models\User::where('phone_number', $value)
                            ->where('id', '!=', Auth::id())
                            ->exists();
                        if ($exists) {
                            $fail('The phone number is already taken.');
                        }
                    }
                },
            ],
            'type' => 'nullable|string',
        ]);

        $existingOtp = Otp::where('phone', $request->phone)
            ->where('type', $request->type)
            ->where('expires_at', '>', now())
            ->first();

        if ($existingOtp) {
            return response()->json([
                'success' => false,
                'message' => 'An OTP has already been sent. Please wait until it expires before requesting a new one.',
                'expires_at' => $existingOtp->expires_at,
            ]);
        }

        $otp = rand(100000, 999999);
        $message = "Your OTP is $otp";

        $otpRecord = new Otp();
        $otpRecord->phone = $request->phone;
        $otpRecord->otp = $otp;
        $otpRecord->expires_at = now()->addMinutes(10);
        $otpRecord->type = $request->type;
        $this->setCommonFields($otpRecord);
        $otpRecord->save();

        $response = app()->environment('local')
            ? Http::withOptions([
                'verify' => 'C:/wamp64/bin/php/php8.2.23/extras/ssl/cacert.pem',
            ])->post('https://api.semaphore.co/api/v4/messages', [
                'apikey'  => env('SEMAPHORE_API_KEY'),
                'number'  => $request->phone,
                'message' => $message,
            ])
            : Http::post('https://api.semaphore.co/api/v4/messages', [
                'apikey'  => env('SEMAPHORE_API_KEY'),
                'number'  => $request->phone,
                'message' => $message,
            ]);

        if ($response->successful()) {
            return response()->json(['success' => true]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Failed to send OTP.',
        ]);
    }

}
