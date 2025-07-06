<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Inertia\Inertia;

class RolesController extends Controller
{
    public function index()
    {
        return Inertia::render('Roles/Index', [
            'roles' => Role::with('permissions')->get(),
        ]);
    }

    public function create()
    {
        return Inertia::render('Roles/Create', [
            'permissions' => Permission::all(),
        ]);
    }

    public function store(Request $request)
    {
        $role = Role::create(['name' => $request->name]);
        $role->syncPermissions($request->permissions);

        return redirect()->route('roles.index');
    }

    public function edit(Role $role)
    {
        return Inertia::render('Roles/Edit', [
            'role' => $role->load('permissions'),
            'permissions' => Permission::all(),
        ]);
    }

    public function update(Request $request, Role $role)
    {
        $role->update(['name' => $request->name]);
        $role->syncPermissions($request->permissions);

        return redirect()->route('roles.index');
    }

    public function destroy(Role $role)
    {
        $role->delete();
        return back();
    }

    public function movePermission(Request $request)
    {
        $request->validate([
            'permission_id' => 'required|exists:permissions,id',
            'from_role_id' => 'required|exists:roles,id',
            'to_role_id' => 'required|exists:roles,id',
        ]);

        $permissionId = $request->permission_id;
        $fromRole = Role::findOrFail($request->from_role_id);
        $toRole = Role::findOrFail($request->to_role_id);

        $fromRole->permissions()->detach($permissionId);
        $toRole->permissions()->attach($permissionId);

        return response()->json(['message' => 'Permission moved.']);
    }

    public function editPermissions(Role $role)
    {
        return Inertia::render('Roles/EditPermissions', [
            'role' => $role->load('permissions'),
            'allPermissions' => Permission::all(),
        ]);
    }

    public function updatePermissions(Request $request, Role $role)
    {
        $validated = $request->validate([
            'permissions' => 'array',
            'permissions.*' => 'exists:permissions,id',
        ]);

        // Assign selected permissions to the role
        $role->syncPermissions($validated['permissions']);

        return redirect()->route('roles.index')->with('success', 'Permissions assigned successfully.');
    }

}
