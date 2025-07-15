<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Bid;
use App\Models\Contracts;
use App\Models\ContractsDetails;
use App\Models\Jobs;
use App\Models\Otp;
use App\Models\Review;
use App\Models\SkilledWorker;
use App\Models\User;
use App\Traits\TCommonFunctions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Chats;
use Illuminate\Support\Facades\Http;

class BidsController extends Controller
{
    use TCommonFunctions;
    public function index()
    {
        return Bid::with(['skilledWorker', 'job'])->orderBy('created_at', 'desc')->get();
    }

    public function verifySmsCode(Request $request)
    {
        $validated = $request->validate([
            'code' => 'required|numeric',
            'userId' => 'required|numeric',
            'contractId' => 'required|numeric',
            'bidId' => 'required|numeric',
            'jobId' => 'required|numeric',
        ]);

        $user = User::find($validated['userId']);
        $contract = Contracts::with(['bid'])->find($validated['contractId']);
        $job = Jobs::find($validated['jobId']);

        $otpRecord = Otp::where('phone', $user->phone_number)
            ->where('otp', $validated['code'])
            ->where('type', 'contract')
            ->where('expires_at', '>', now())
            ->first();

        if (!$otpRecord) {
            return response()->json(['message' => 'Invalid code']);
        }

        $new = new ContractsDetails();
        $new->ContractID = $contract->id;
        $new->BidID = $request->bidId;
        $new->UserID = $user->id ?? 0;
        $new->method = 'sms';
        $new->otp = $request->input('code');
        $this->setCommonFields($new);
        $new->save();

        $otpRecord->delete();

        return response()->json(['message' => 'Contract signed successfully']);
    }

    public function sendSmsCode(Request $request)
    {
        $validated = $request->validate([
            'userId' => 'required|numeric',
            'contractId' => 'required|numeric',
            'jobId' => 'required|numeric',
        ]);

        $user = User::find($validated['userId']);

        $otp = rand(100000, 999999);
        $message = "You are about to sign the contract with SMS. Your OTP is $otp. If you did not request this, please ignore this message.";

        $otpRecord = new Otp();
        $otpRecord->phone = $user->phone_number;
        $otpRecord->otp = $otp;
        $otpRecord->expires_at = now()->addMinutes(10);
        $otpRecord->type = 'contract';
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
                'number'  => $user->phone_number,
                'message' => $message,
            ])
            : Http::post('https://api.semaphore.co/api/v4/messages', [
                'apikey'  => env('SEMAPHORE_API_KEY'),
                'number'  => $user->phone_number,
                'message' => $message,
            ]);

        if ($response->successful()) {
            return response()->json(['success' => true]);
        }

        return response()->json(['message' => 'SMS code sent successfully']);
    }

    public function contracts($id)
    {
        $contract = Contracts::with(['details.user', 'job.homeowner', 'details.bid', 'job.applicants'])
            ->where('id', $id)
            ->first();

        if (!$contract) {
            return response()->json(['message' => 'Contract not found or access denied'], 404);
        }

        return response()->json($contract);
    }


    public function signContract(Request $request)
    {
         $validated = $request->validate([
            'JobID' => 'required|numeric',
             'BidID' => 'nullable|numeric',
             'ContractID' => 'required|numeric',
             'method' => 'required|string',
        ]);

        $job = Jobs::find($validated['JobID']);
        $bid = Bid::find($validated['BidID'] ?? 0);
        if(!$job){
            return response()->json(['message' => 'Job not found'], 404);
        }

        $existContractDetails = ContractsDetails::where('ContractID', $request->ContractID)
            ->where('BidID', $bid->id)
            ->where('UserID', Auth::id())
            ->first();
        if(!$existContractDetails){
            $contractDetails = new ContractsDetails();
            $contractDetails->ContractID = $request->ContractID;
            $contractDetails->BidID = $bid->id;
            $contractDetails->UserID = Auth::id();
            $contractDetails->method = $request->method;
            $this->setCommonFields($contractDetails);
            $contractDetails->save();
        }

        $extraData = [
            'id' => $request->ContractID,
            'BidID' => $bid->id,
            'jobId' => $job->id,
            'UserID' => $bid->UserID,
        ];

        (new NotificationController)->sendNotification2(
            $bid->UserID,
            'Service Contract Agreement',
            'Good news! Your service contract has been signed',
            'ContractScreen',
            $extraData
        );

        return response()->json($bid);
    }

    public function submitReview(Request $request)
    {
        $validated = $request->validate([
            'BidID' => 'required|numeric',
            'reviewer_id' => 'required|numeric',
            'reviewee_id' => 'required|numeric',
            'rating' => 'required|numeric',
            'comment' => 'required|string|max:255',
        ]);

        $review = new Review();
        $review->BidID = $validated['BidID'];
        $review->reviewer_id = $validated['reviewer_id'];
        $review->reviewee_id = $validated['reviewee_id'];
        $review->rating = $validated['rating'];
        $review->comment = $validated['comment'];
        $this->setCommonFields($review);
        $review->save();

        $cc = Bid::find($validated['BidID']);
        $cc->isReviewed = 1;
        $cc->save();

        $averageRating = Review::where('reviewee_id', $validated['reviewee_id'])->avg('rating');

        $skilledWorker = SkilledWorker::firstOrNew([
            'user_id' => $validated['reviewee_id']
        ]);

        $skilledWorker->rating = $averageRating;

        if (!$skilledWorker->exists) {
            $this->setCommonFields($skilledWorker);
        }

        $skilledWorker->save();

        (new NotificationController)->sendNotification2(
            $validated['reviewee_id'],
            'Your employer made a review for your task',
            'Your employer has reviewed your task and gave you a rating of '.$validated['rating'].'.');
        return response()->json($review);
    }


    public function newStatus(Request $request, $bidID, $NewStatus){
        $cc = Bid::find($bidID);
//        $cc->isReviewed = 0;
        $cc->ApplicationStatus = $NewStatus;
        if($NewStatus === 'Hired'){
            $cc->dateHired = date('Y-m-d H:i:s', strtotime('now'));
        }
        $cc->save();

        $autoMessage = match ($NewStatus) {
            'Hired' => 'Congratulations! You have been hired for the position.',
            'Rejected' => 'We regret to inform you that your application has been rejected.',
            'shortlisted' => 'Good news! You have been shortlisted. Please wait for further instructions.',
            default => "Your application status has been updated to: $NewStatus.",
        };

        Chats::create([
            'sender_id' => Auth::id(),
            'receiver_id' => $cc->UserID,
            'from' => 'auto',
            'message' => $autoMessage,
            'attachment_url' => null,
            'attachment_type' => null,
        ]);

        $jobInfo = Jobs::find($cc->job_id);

        (new NotificationController)->sendNotification2(
            $cc->UserID,
            'Application Status',
            $autoMessage,
            'ApplicationDetails',
            ['id' => $jobInfo->id]
        );
    }

    public function workersBids(Request $request)
    {
        return Bid::with(['skilledWorker', 'job'])->where('UserID', Auth::id())->orderBy('created_at', 'desc')->get();
    }

    public function workersBidsApplications($id)
    {
        $bid = Bid::with([
            'details.info',
            'job.skills_required.skill',
            'job.contract.details'
        ])->findOrFail($id);

        $job = $bid->job;

        if (is_null($bid->ApplicationStatus) && Auth::id() === $job->homeowner_id) {
            $bid->update([
                'ApplicationStatus' => 'The employer has seen your application.'
            ]);

            Chats::create([
                'sender_id' => Auth::id(),
                'receiver_id' => $bid->UserID,
                'from' => 'auto',
                'message' => 'The employer has seen your application.',
                'attachment_url' => null,
                'attachment_type' => null,
            ]);
        }

        return $bid;
    }


    public function withdrawBid($id)
    {
        $bid = Bid::find($id);
        if(!$bid){
            return response()->json(['message' => 'Bid not found'], 404);
        }
        $bid->delete();
        return response()->json($bid);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'bid_amount' => 'required|max:255',
            'proposed_duration' => 'required|string|max:255',
            'job_id' => 'required|numeric',
        ]);

        $class = new Bid();
        $class->UserID = Auth::id();
        $class->job_id = $request->job_id;
        $class->bid_amount = $request->bid_amount;
        $class->proposed_duration = $request->proposed_duration;
        $this->setCommonFields($class);
        $class->save();

        $jobInfo = Jobs::find($request->job_id);

        (new NotificationController)->sendNotification2(
            $jobInfo->homeowner_id,
            'Job Application',
            'Hello, someone has applied for the job '.$jobInfo->title.'. Please check the application details.',
            'ShowJob',
            ['id' => $jobInfo->id]
        );

        return response()->json($class, 201);
    }

    public function show($id)
    {
        $class = Jobs::where('id', $id)->first();

        if (!$class) {
            return response()->json(['message' => 'Job not found'], 404);
        }

        return response()->json($class);
    }

    public function update(Request $request, $id)
    {
        $class = Jobs::where('id', $id)->where('homeowner_id', Auth::id())->first();

        if (!$class) {
            return response()->json(['message' => 'Class not found'], 404);
        }

        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string|max:255',
            'due_date' => 'required|date',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'rate_amount' => 'required|numeric',
            'rate_type' => 'required|string|max:255',
        ]);

        $class->update([
            ...$validated,
            'updated_by' => Auth::id(),
            'due_date' => date('Y-m-d H:i:s', strtotime($validated['due_date'])),
            'start_date' => date('Y-m-d', strtotime($validated['start_date'])),
            'end_date' => date('Y-m-d', strtotime($validated['end_date'])),
        ]);

        return response()->json($class);
    }

    public function destroy($id)
    {
        $class = Jobs::where('id', $id)->where('homeowner_id', Auth::id())->first();

        if (!$class) {
            return response()->json(['message' => 'Class not found'], 404);
        }

        $class->delete();

        return response()->json(['message' => 'Class deleted']);
    }
}
