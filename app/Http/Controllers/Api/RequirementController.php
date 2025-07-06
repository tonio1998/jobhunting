<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\JobRequirementsSubmission;
use App\Models\Requirement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RequirementController extends Controller
{
    public function index()
    {
        return Requirement::get();
    }

    public function getRequirementsData($data)
    {
        $data = explode(',', $data);
        $class = Requirement::with(['user'])->whereIn('id', $data)->get();
        return $class;
    }

    public function index_files($JobID, $UserID)
    {
        $files = JobRequirementsSubmission::where('JobID', $JobID)
            ->where('UserID', $UserID)
            ->get();

        return response()->json([
            'success' => true,
            'files' => $files
        ]);
    }



    public function show($id)
    {
        $class = Requirement::with(['user'])->where('id', $id)->first();

        if (!$class) {
            return response()->json(['message' => 'Requirement not found'], 404);
        }

        return response()->json($class);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'type' => 'required|string|max:255',
            'status' => 'required|string|max:255',
            'created_by' => 'required|numeric',
            'updated_by' => 'required|numeric',
        ]);

        $class = new Requirement();
        $class->user_id = Auth::id();
        $class->type = $request->type;
        $class->status = $request->status;
        $this->setCommonFields($class);
        $class->save();

        return response()->json($class, 201);
    }

    public function update(Request $request, $id)
    {
        $class = Requirement::where('id', $id)->first();

        if (!$class) {
            return response()->json(['message' => 'Class not found'], 404);
        }

        $validated = $request->validate([
            'type' => 'required|string|max:255',
            'status' => 'required|string|max:255',
            'updated_by' => 'required|numeric',
        ]);

        $class->update([
            ...$validated,
            'updated_by' => Auth::id(),
        ]);

        return response()->json($class);
    }

    public function destroy($id)
    {
        $class = Requirement::where('id', $id)->first();

        if (!$class) {
            return response()->json(['message' => 'Class not found'], 404);
        }

        $class->delete();

        return response()->json(['message' => 'Class deleted']);
    }

    public function restore($id)
    {
        $class = Requirement::where('id', $id)->first();

        if (!$class) {
            return response()->json(['message' => 'Class not found'], 404);
        }

        $class->restore();

        return response()->json(['message' => 'Class restored']);
    }
}
