<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\JobRequirementsSubmission;
use App\Models\Requirement;
use App\Models\WorkerAttachments;
use App\Models\WorkerProfile;
use Illuminate\Http\Request;
use App\Traits\TCommonFunctions;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Workers;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    use TCommonFunctions;

    public function uploadUserRequirements(Request $request)
    {
        $validated = $request->validate([
            'file' => 'required|file',
            'RequirementID' => 'required|numeric',
            'UserID' => 'required|numeric',
            'JobID' => 'required|numeric',
        ]);

        $file = $request->file('file');

        $relativePath = $file->store("user_files/{$validated['UserID']}/submission/{$validated['JobID']}/{$validated['RequirementID']}", 'public');

        $source = storage_path('app/public/' . $relativePath);
        $destination = public_path('storage/' . $relativePath);

        $destinationDir = dirname($destination);
        if (!file_exists($destinationDir)) {
            mkdir($destinationDir, 0755, true);
        }

        copy($source, $destination);

        $attachment = new JobRequirementsSubmission();
        $attachment->RequirementID = $validated['RequirementID'];
        $attachment->UserID = $validated['UserID'];
        $attachment->JobID = $validated['JobID'];
        $attachment->FilePath = $relativePath;
        $attachment->FileName = $file->getClientOriginalName();
        $attachment->size = $file->getSize();
        $attachment->type = $file->getMimeType();

        $this->setCommonFields($attachment);
        $attachment->save();

        return response()->json([
            'success' => true,
            'message' => 'File uploaded successfully',
            'file_url' => asset('storage/' . $relativePath),
            'data' => $attachment,
        ]);
    }


    public function show($id)
    {
        $class = User::with(['info', 'skills.skill', 'files.fileDetails', 'rating', 'bids.job', 'jobs', 'profile', 'earnings'])
            ->where('id', $id)
            ->first();

        if (!$class) {
            return response()->json(['message' => 'User not found'], 404);
        }

        $class->total_earnings = $class->earnings->sum('amount');

        return response()->json($class);
    }


    public function deleteUserFile($id){
        $file = WorkerAttachments::find($id);
        if($file){
            $file->delete();
        }

        $checkCounts = WorkerAttachments::where('UserID', Auth::id())->count();
        if($checkCounts === 0){
            WorkerProfile::updateOrCreate(
                ['UserID' => Auth::id()],
                ['requirements' => 0]
            );
        }
        return response()->json(['message' => 'File deleted successfully'], 200);
    }

    public function getUserFiles($id)
    {
        $user = User::with(['files'])->findOrFail($id);
        return $user->files;
    }

    public function uploadFile(Request $request, $id, $requirement_id)
    {
        $user = User::findOrFail($id);

        if ($request->hasFile('file')) {
            $relativePath = $request->file('file')->store('user_files/' . $id . '/' . $requirement_id, 'public');

            $source = storage_path('app/public/' . $relativePath);
            $destination = public_path('storage/' . $relativePath);
            $destinationDir = dirname($destination);

            if (!file_exists($destinationDir)) {
                mkdir($destinationDir, 0755, true);
            }

            copy($source, $destination);

            $file = new WorkerAttachments();
            $file->RequirementID = $requirement_id;
            $file->UserID = $id;
            $file->FilePath = $relativePath;
            $file->FileName = $request->file('file')->getClientOriginalName();
            $file->size = $request->file('file')->getSize();
            $file->type = $request->file('file')->getMimeType();
            $this->setCommonFields($file);
            $file->save();

            WorkerProfile::updateOrCreate(
                ['UserID' => $id],
                ['requirements' => 1]
            );

            return response()->json([
                'message' => 'File uploaded successfully',
                'file_url' => asset('storage/' . $relativePath),
                'user' => $user
            ]);
        }

        return response()->json(['message' => 'No file uploaded'], 400);
    }



    public function update(Request $request, $id)
    {
        $class = User::where('id', $id)->first();

        if (!$class) {
            return response()->json(['message' => 'User not found'], 404);
        }

        $validated = $request->validate([
            'fullName' => 'required|string|max:255',
            'location' => 'nullable',
            'Nationality' => 'required|string|max:255'
        ]);

        $validated['current_location'] = json_encode($validated['location'] ,true);
        $validated['name'] = $validated['fullName'];

        $class->update([
            ...$validated,
            'name' => $validated['name'],
            'updated_by' => Auth::id(),
        ]);

        $info = Workers::where('UserID', $id)->first();
        if(!$info){
            $new = new Workers();
            $new->UserID = $id;
            $new->Nationality = $request->Nationality;
            $new->fullName = $validated['name'];
            $new->nickname = $request->nickname;
            $new->dob = date('Y-m-d', strtotime($request->dob));
            $new->gender = $request->gender;
            $new->civilStatus = $request->civilStatus;
            $this->setCommonFields($new);
            $new->save();
        }else{
            $info->Nationality = $request->Nationality;
            $info->fullName = $validated['name'];
            $info->nickname = $request->nickname;
            $info->dob = date('Y-m-d', strtotime($request->dob));
            $info->gender = $request->gender;
            $info->civilStatus = $request->civilStatus;
            $info->save();
        }

        WorkerProfile::updateOrCreate(
            ['UserID' => $id],
            ['personal_info' => 1]
        );


        return response()->json($class);
    }

    public function updateProfilePicture(Request $request, $id)
    {
        $validate = $request->validate([
            'image' => 'nullable|max:15360',
        ]);

        $user = User::findOrFail($id);

        if ($request->hasFile('image')) {
            $relativePath = $request->file('image')->store("user_files/{$id}/profile_pic", 'public');

            $source = storage_path('app/public/' . $relativePath);
            $destination = public_path('storage/' . $relativePath);
            $destinationDir = dirname($destination);

            if (!file_exists($destinationDir)) {
                mkdir($destinationDir, 0755, true);
            }

            copy($source, $destination);

            $user->profile_pic = $relativePath;
            $user->save();
        }

        return response()->json([
            'message' => 'Profile picture updated',
            'user' => $user,
            'profile_pic_url' => asset('storage/' . $user->profile_pic),
        ]);
    }

    public function updateRole(Request $request)
    {
        $request->validate([
            'role' => 'required|string|exists:roles,name',
        ]);

        $user = User::find(Auth::id());

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        $user->syncRoles([$request->role]);
        $user->role = $request->role;
        $user->save();

        return response()->json(['message' => 'Role updated successfully']);
    }

    public function saveLocation(Request $request)
    {
        $data = $request->except('user_id');

        $user = User::where('id', $request->user_id)->update([
            'current_location' => json_encode($data)
        ]);

        return response()->json([
            'message' => 'Location saved successfully',
            'user' => $user
        ]);
    }

    public function changePassword(Request $request, $id)
    {
        $request->validate([
            'current_password' => 'required',
            'password' => 'required|string|min:6|confirmed',
        ]);

        $user = User::findOrFail($id);

        if (!Hash::check($request->current_password, $user->password)) {
            return response()->json(['message' => 'Current password is incorrect.'], 403);
        }

        $user->password = Hash::make($request->password);
        $user->save();

        return response()->json(['message' => 'Password updated successfully.']);
    }


}
