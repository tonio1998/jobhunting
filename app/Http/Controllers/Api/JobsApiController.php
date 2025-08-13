<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Bid;
use App\Models\Contracts;
use App\Models\JobFavorite;
use App\Models\Jobs;
use App\Models\JobSkill;
use App\Traits\TCommonFunctions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class JobsApiController extends Controller
{
    use TCommonFunctions;
    public function index()
    {
        return Jobs::with(['homeowner', 'applicants', 'skills_required.skill'])
            ->orderBy('created_at', 'desc')
            ->paginate(10);
    }

    public function homeownerJobs($id)
    {
        return Jobs::with([
            'homeowner',
            'skills_required.skill',
            'applicants' => function ($query) {
                $query->whereHas('details')
                ->with('details.info', 'job.skills_required.skill', 'job.contract.details');
            },
        ])
            ->where('homeowner_id', $id)
            ->orderBy('created_at', 'desc')
            ->paginate(10);
    }


    public function addFavorite(Request $request)
    {
        $id = $request->item_id;
        $job = JobFavorite::where('JobID', $id)
            ->where('UserID', Auth::id())
            ->first();
        if(!$job){
            $new = new JobFavorite();
            $new->JobID = $id;
            $new->UserID = Auth::id();
            $this->setCommonFields($new);
            $new->save();
        }else{
            $job->delete();
        }

        return response()->json(['message' => 'Favorite added successfully']);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'due_date' => 'required|date',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'rate_amount' => 'required|numeric',
            'rate_type' => 'required|string|max:255',
            'requirements' => 'required|array',
            'placeOfAssignment' => 'nullable',
            'placeOfAssignmentText' => 'nullable',
            'selectedSkills' => 'required',
        ]);

        $class = new Jobs($validated);
        $class->homeowner_id = Auth::id();
        $class->due_date = date('Y-m-d H:i:s', strtotime($validated['due_date']));
        $class->start_date = date('Y-m-d', strtotime($validated['start_date']));
        $class->end_date = date('Y-m-d', strtotime($validated['end_date']));
        $class->requirements = json_encode($validated['requirements']);
        $class->placeOfAssignment = json_encode($validated['placeOfAssignment'] ?? null);
        $class->placeOfAssignmentText = $validated['placeOfAssignmentText'] ?? null;
        $this->setCommonFields($class);
        $class->save();

        $contract = new Contracts();
        $contract->JobID = $class->id;
        $this->setCommonFields($contract);
        $contract->save();

        if(count($validated['selectedSkills']) > 0){
            foreach ($request->selectedSkills as $skill) {
                $new = new JobSkill();
                $new->job_id = $class->id;
                $new->skill_id = $skill ?? 0;
                $this->setCommonFields($new);
                $new->save();
            }
        }

        $extraData = [
            'id' => $class->id,
        ];

        (new NotificationController)->sendNotification2('all', $validated['title'] .'-'.$validated['rate_type'].'-'.$validated['rate_amount'], $validated['description'], 'ApplyForm', $extraData);

        return response()->json($class, 201);
    }

    public function show($id)
    {
        $class = Jobs::with(['applicants.details', 'homeowner', 'skills_required.skill'])->where('id', $id)->first();

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
            'description' => 'required|string',
            'due_date' => 'required|date',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'rate_amount' => 'required|numeric',
            'rate_type' => 'required|string|max:255',
            'requirements' => 'required|array',
            'placeOfAssignment' => 'nullable',
            'placeOfAssignmentText' => 'nullable',
            'selectedSkills' => 'required',
        ]);

        $class->update([
            ...$validated,
            'updated_by' => Auth::id(),
            'due_date' => date('Y-m-d H:i:s', strtotime($validated['due_date'])),
            'start_date' => date('Y-m-d', strtotime($validated['start_date'])),
            'end_date' => date('Y-m-d', strtotime($validated['end_date'])),
            'requirements' => json_encode($validated['requirements']),
            'placeOfAssignment' => json_encode($validated['placeOfAssignment'] ?? null),
            'placeOfAssignmentText' => $validated['placeOfAssignmentText'] ?? null,
        ]);

        JobSkill::where('job_id', $id)->delete();

        if(count($validated['selectedSkills']) > 0){
            foreach ($request->selectedSkills as $skill) {
                $new = new JobSkill();
                $new->job_id = $id;
                $new->skill_id = $skill ?? 0;
                $this->setCommonFields($new);
                $new->save();
            }
        }

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
