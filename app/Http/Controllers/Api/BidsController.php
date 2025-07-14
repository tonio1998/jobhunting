<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Bid;
use App\Models\Contracts;
use App\Models\ContractsDetails;
use App\Models\Jobs;
use App\Models\Review;
use App\Models\SkilledWorker;
use App\Traits\TCommonFunctions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Chats;
class BidsController extends Controller
{
    use TCommonFunctions;
    public function index()
    {
        return Bid::with(['skilledWorker', 'job'])->orderBy('created_at', 'desc')->get();
    }

    public function contracts($id)
    {
        $bid = Bid::find($id);
        if(!$bid){
            return response()->json(['message' => 'Bid not found'], 404);
        }

        $contracts = Contracts::with(['details'])->where('BidID', $bid->id)
            ->whereHas('details', function ($query) {
                $query->where('UserID', Auth::id());
            })
            ->first();
        return response()->json($contracts);
    }

    public function signContract(Request $request)
    {
         $validated = $request->validate([
            'BidID' => 'required|numeric',
             'method' => 'required|string',
        ]);

        $bid = Bid::find($validated['BidID']);
        if(!$bid){
            return response()->json(['message' => 'Bid not found'], 404);
        }

        $contract = Contracts::where('BidID', $bid->id)->first();
        if(!$contract){
            $contract = new Contracts();
            $contract->BidID = $bid->id;
            $contract->JobID = $bid->job_id;
            $this->setCommonFields($contract);
            $contract->save();
        }

        $existContractDetails = ContractsDetails::where('ContractID', $contract->id)
            ->where('UserID', Auth::id())
            ->first();
        if(!$existContractDetails){
            $contractDetails = new ContractsDetails();
            $contractDetails->ContractID = $contract->id;
            $contractDetails->UserID = Auth::id();
            $contractDetails->method = $request->method;
            $this->setCommonFields($contractDetails);
            $contractDetails->save();
        }

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
        $cc = Bid::find($id);
        $posted = Jobs::find($cc->job_id);
        if(is_null($cc->ApplicationStatus) && Auth::id() === $posted->homeowner_id){
            $cc->ApplicationStatus = "The employee has seen your application.";
            $cc->save();

            $message = Chats::create([
                'sender_id' => Auth::id(),
                'receiver_id' => $cc->UserID,
                'from' => 'auto',
                'message' => 'The employee has seen your application.',
                'attachment_url' => null,
                'attachment_type' => null,
            ]);
        }

        return Bid::with(['details.info', 'job.skills_required.skill'])->where('id', $id)->orderBy('created_at', 'desc')->first();
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
