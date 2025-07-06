<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Jobs;
use App\Models\Skill;
use App\Models\WorkerProfile;
use App\Models\Workers;
use App\Models\WorkerSkill;
use App\Traits\TCommonFunctions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SkillsController extends Controller
{
    use TCommonFunctions;

    public function index(Request $request)
    {
        $search = $request->query('search');

        $skills = Skill::when($search, function ($query, $search) {
            return $query->where('description', 'like', '%' . $search . '%');
        })->get();

        return response()->json($skills);
    }


    public function workerSkills($id)
    {
        return WorkerSkill::with(['skill'])->where('UserID', $id)->orderBy('created_at', 'desc')->get();
    }

    public function addSkillToWorker(Request $request)
    {
        $request->validate([
            'skill_id' => 'required|integer|exists:skills,id',
            'UserID' => 'required|integer|exists:users,id',
        ]);

        $id = $request->skill_id;
        $UserID = $request->UserID;

        $existing = WorkerSkill::where('skill_id', $id)->where('UserID', $UserID)->first();

        if (!$existing) {
            $class = new WorkerSkill();
            $class->UserID = $UserID;
            $class->skill_id = $id;
            $this->setCommonFields($class);
            $class->save();

            WorkerProfile::updateOrCreate(
                ['UserID' => $UserID],
                ['skills' => 1]
            );

            return response()->json(['message' => 'Skill added']);
        } else {
            return response()->json(['message' => 'Skill already added'], 400);
        }
    }

    public function removeSkillFromWorker(Request $request)
    {
        $request->validate([
            'worker_skill_id' => 'required|integer|exists:worker_skills,id',
            'UserID' => 'required|integer|exists:users,id',
        ]);

        $id = $request->worker_skill_id;
        $UserID = $request->UserID;

        $existing = WorkerSkill::where('id', $id)->where('UserID', $UserID)->first();

        if ($existing) {
            $existing->delete();

            $checkCounts = WorkerSkill::where('UserID', $UserID)->count();
            if($checkCounts === 0){
                WorkerProfile::updateOrCreate(
                    ['UserID' => $UserID],
                    ['skills' => 0]
                );
            }
            return response()->json(['message' => 'Skill removed']);
        } else {
            return response()->json(['message' => 'Skill not found or not owned by user'], 404);
        }
    }



    public function store(Request $request)
    {
        $validated = $request->validate([
            'description' => 'required|string|max:255',
        ]);

        $class = new Skill($validated);
        $class->description = $validated['description'];
        $this->setCommonFields($class);
        $class->save();

        if($class->id) {
            $c = new WorkerSkill();
            $c->skill_id = $class->id;
            $c->UserID = Auth::id();
            $this->setCommonFields($c);
            $c->save();
        }

        return response()->json($class, 201);
    }

    public function show($id)
    {
        $class = Skill::where('id', $id)->first();

        if (!$class) {
            return response()->json(['message' => 'Skills not found'], 404);
        }

        return response()->json($class);
    }

    public function update(Request $request, $id)
    {
        $class = Skill::where('id', $id)->first();

        if (!$class) {
            return response()->json(['message' => 'Skill not found'], 404);
        }

        $validated = $request->validate([
            'description' => 'required|string|max:255',
        ]);

        $class->update([
            ...$validated,
            'updated_by' => Auth::id(),
        ]);

        return response()->json($class);
    }

    public function destroy($id)
    {
        $class = Skill::where('id', $id)->first();

        if (!$class) {
            return response()->json(['message' => 'Skill not found'], 404);
        }

        $class->delete();

        return response()->json(['message' => 'Skill deleted']);
    }
}
