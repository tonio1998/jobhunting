<?php

namespace App\Http\Controllers;

use App\Models\Otp;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Inertia\Inertia;

class PublicVerificationController extends Controller
{
    public function deleteRequestAccount(Request $request)
    {
        $contact = trim($request->input('contact'));
        $contact = preg_replace('/[^0-9]/', '', $contact);

        if (preg_match('/^9\d{9}$/', $contact)) {
            $normalizedContact = '+63' . $contact;
        } elseif (preg_match('/^09\d{9}$/', $contact)) {
            $normalizedContact = '+63' . substr($contact, 1);
        } elseif (preg_match('/^639\d{9}$/', $contact)) {
            $normalizedContact = '+' . $contact;
        } elseif (preg_match('/^\+639\d{9}$/', $contact)) {
            $normalizedContact = $contact;
        } else {
            return response()->json([
                'message' => 'Invalid contact. Please enter a valid Philippine mobile number.',
            ], 422);
        }

        $user = User::where('phone_number', $normalizedContact)->first();
        if (!$user) {
            return response()->json(['error' => 'User not found.'], 404);
        }

        $otp = rand(100000, 999999);
        DB::table('account_deletion_otps')->updateOrInsert(
            ['contact' => $normalizedContact],
            ['otp' => $otp, 'expires_at' => now()->addMinutes(10)]
        );

        $response = Http::asForm()->post('https://api.semaphore.co/api/v4/messages', [
            'apikey'     => '2db497e7dca562167ae58275bc4bf2c0',
            'number'     => $normalizedContact,
            'message'    => "You requested account deletion. Your OTP is $otp. If you did not request this, please ignore this message.",
            'sendername' => 'DJEMC'
        ]);

        if (!$response->successful()) {
            return response()->json([
                'message' => 'Failed to send OTP via SMS.',
                'error' => $response->json()
            ], 500);
        }


        return response()->json(['message' => 'OTP sent via SMS.', 'contact' => $normalizedContact]);

    }

    public function verifyOtpS(Request $request)
    {
        $contact = $request->query('contact');

        return Inertia::render('VerifyOTP', [
            'contact' => $contact,
        ]);
    }

    public function verifyOTPAccount(Request $request)
    {
        $request->validate([
            'contact' => 'required',
            'otp' => 'required|digits:6',
        ]);

        $record = DB::table('account_deletion_otps')
            ->where('contact', $request->contact)
            ->first();

        if (!$record || $record->otp != $request->otp) {
            return response()->json(['error' => 'Invalid OTP.'], 400);
        }

        if (Carbon::parse($record->expires_at)->isPast()) {
            return response()->json(['error' => 'OTP expired.'], 400);
        }

        $user = User::where('email', $request->contact)
            ->orWhere('phone_number', $request->contact)
            ->first();

        if ($user) {
            $user->delete();
        }

        DB::table('account_deletion_otps')->where('contact', $request->contact)->delete();

        return response()->json(['message' => 'Account deleted successfully.']);
    }
    public function deleteAccount(Request $request)
    {
        return Inertia::render('DeleteAccount');
    }

    public function sendForgotPasswordOTP(Request $request)
    {
        $request->validate([
            'phone' => 'required',
        ]);

        $existingOtp = Otp::where('phone', $request->phone)
            ->where('type', 'forgot-password')
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
        $message = "You requested a password reset. Your OTP is $otp. If you did not request this, please ignore this message.";

        $otpRecord = new Otp();
        $otpRecord->phone = $request->phone;
        $otpRecord->otp = $otp;
        $otpRecord->expires_at = now()->addMinutes(10);
        $otpRecord->type = 'forgot-password';
        $otpRecord->created_by = 0;
        $otpRecord->updated_by = 0;
        $otpRecord->status = 'active';
        $otpRecord->archived = 0;
        $otpRecord->created_at = now();
        $otpRecord->updated_at = now();
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


    public function verifyOTP(Request $request)
    {
        $request->validate([
            'phone' => 'required',
            'otp' => 'required',
            'type' => 'nullable|string'
        ]);

        $record = Otp::where('phone', $request->phone)->where('otp', $request->otp)->first();

        if ($record  && strtotime($record->expires_at) > strtotime(now())) {
            $user = User::where('phone_number', $request->phone)->first();
            $password = rand(100000, 999999);
            if($request->type === 'forgot-password'){
                if($user){
                    $user->password = Hash::make($password);
                    $user->save();
                }
                $record->delete();

                $response = app()->environment('local')
                    ? Http::withOptions([
                        'verify' => 'C:/wamp64/bin/php/php8.2.23/extras/ssl/cacert.pem',
                    ])->post('https://api.semaphore.co/api/v4/messages', [
                        'apikey'  => env('SEMAPHORE_API_KEY'),
                        'number'  => $request->phone,
                        'message' => 'Your password has been changed. Your new password is '.$password,
                    ])
                    : Http::post('https://api.semaphore.co/api/v4/messages', [
                        'apikey'  => env('SEMAPHORE_API_KEY'),
                        'number'  => $request->phone,
                        'message' => 'Your password has been changed. Your new password is '.$password,
                    ]);

                return response()->json(['success' => true, 'message' => 'Your password has been changed. Your new password is: '.$password]);
            }

            if($request->type === 'change-number'){
                $isExist = User::where('phone_number', $request->phone)->first();
                if(!$isExist){
                    $user->update([
                        'phone_number' => $request->phone,
                    ]);

                    $record->delete();
                    return response()->json(['success' => true]);
                }else{
                    return response()->json(['success' => false, 'message' => 'The number is already taken']);
                }
            }
        }

        return response()->json(['success' => false, 'message' => 'OTP invalid or expired']);
    }
}
