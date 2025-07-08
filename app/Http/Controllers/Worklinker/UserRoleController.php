<?php

namespace App\Http\Controllers\Worklinker;
use App\Http\Controllers\Controller;

use App\Models\Role;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Validation\Rule;
use Inertia\Inertia;

class UserRoleController extends Controller
{
    public function edit(User $user)
    {
        $roles = Role::all();

        return Inertia::render('Users/EditRoles', [
            'user' => $user->load('roles'),
            'roles' => $roles,
        ]);
    }

    public function update(Request $request, User $user)
    {
        $roles = Role::pluck('name')->toArray();

        $request->merge([
            'roles' => array_unique($request->roles ?? []),
        ]);

        $request->validate([
            'roles'   => 'array',
            'roles.*' => ['required', Rule::in($roles)],
        ]);

        $user->syncRoles($request->roles);

        return redirect()->route('users.index')->with('success', 'Roles updated.');
    }

}
