<?php

namespace App\Http\Controllers;

use App\Models\User;
use Spatie\Permission\Models\Permission;
use Illuminate\Http\Request;
use Inertia\Inertia;

class UserPermissionController extends Controller
{
    public function edit(User $user)
    {
        $permissions = Permission::all();

        return Inertia::render('Users/EditPermissions', [
            'user' => $user->load('permissions'),
            'permissions' => $permissions,
        ]);
    }

    public function update(Request $request, User $user)
    {
        $request->validate([
            'permissions' => 'array',
            'permissions.*' => 'exists:permissions,name',
        ]);

        $user->syncPermissions($request->permissions);

        return redirect()->route('users.index')->with('success', 'Permissions updated.');
    }
}
