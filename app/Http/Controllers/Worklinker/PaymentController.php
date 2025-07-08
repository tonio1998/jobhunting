<?php

namespace App\Http\Controllers\Worklinker;
use App\Http\Controllers\Controller;

use Google\Service\CloudSourceRepositories\Repo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use App\Models\Payment;
use App\Models\Bid;
class PaymentController extends Controller
{
    public function success(Request $request)
    {
        // You can log or inspect the query parameters if any were sent
        Log::info('🟢 Payment Success', $request->all());
        return response()->json([
            'message' => 'Payment successful!',
            'data' => $request->all(),
        ]);
    }


    public function cancel(Request $request)
    {
        // You can log or inspect the query parameters if any were sent
        Log::info('🟢 Payment Success', $request->all());
        return response()->json([
            'message' => 'Payment successful!',
            'data' => $request->all(),
        ]);
    }


    public function failure(Request $request)
    {
        // You can log or inspect the query parameters if any were sent
        Log::info('🟢 Payment Success', $request->all());
        return response()->json([
            'message' => 'Payment successful!',
            'data' => $request->all(),
        ]);
    }

    public function logCharge(Request $request)
    {
        $validated = $request->validate([
            'user_id' => 'required|exists:users,id',
            'amount' => 'required|numeric',
            'Remark' => 'required|in:success,failure,cancel',
            'BidID' => 'required'
        ]);

        $payment = Payment::create([
            'user_id' => $validated['user_id'],
            'amount' => $validated['amount'],
            'Remark' => $validated['Remark'],
            'BidID' => $validated['BidID']
        ]);

        $cc = Bid::find($request->BidID);
        $cc->isPaid = 1;
        $cc->save();

        return response()->json([
            'message' => 'Payment log saved.',
            'data' => $payment,
        ]);
    }

    public function gcashCharge(Request $request)
    {
        $successRedirectUrl = $request->input('success_redirect_url', env('APP_URL') . '/api/payment/success');
        $failureRedirectUrl = $request->input('failure_redirect_url', env('APP_URL') . '/api/payment/failure');
        $cancelRedirectUrl  = $request->input('cancel_redirect_url', env('APP_URL') . '/api/payment/cancel');

        $response = Http::withHeaders([
            'Authorization' => 'Basic ' . base64_encode(env('XENDIT_SECRET_KEY') . ':'),
            'Content-Type' => 'application/json',
            'x-callback-url' => env('APP_URL') . '/api/payment/xendit-webhook',
        ])->post('https://api.xendit.co/ewallets/charges', [
            'reference_id' => uniqid('worklinker_'),
            'currency' => 'PHP',
            'amount' => $request->amount,
            'checkout_method' => 'ONE_TIME_PAYMENT',
            'channel_code' => 'PH_GCASH',
            'channel_properties' => [
                'success_redirect_url' => $successRedirectUrl,
                'cancel_redirect_url'  => $cancelRedirectUrl,
                'failure_redirect_url' => $failureRedirectUrl,
            ],
        ]);

        return response()->json([
            'status' => $response->status(),
            'body' => $response->json(),
        ]);
    }


}
