<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PermissionController extends Controller
{
    public function index()
    {
        return Inertia::render('Permissions/Index', [
            'permissions' => Permission::with('roles')->get(),
        ]);
    }

    public function create()
    {
        return Inertia::render('Permissions/Create');
    }

    public function store(Request $request)
    {
        Permission::create(['name' => $request->name]);
        return redirect()->route('permissions.index');
    }

    public function edit(Request $request)
    {
        $permission = Permission::findOrFail($request->segment(2));
        return Inertia::render('Permissions/Edit', [
            'permission' => $permission,
        ]);
    }

    public function update(Request $request)
    {
        $permission = Permission::findOrFail($request->segment(2));
        $permission->update(['name' => $request->name]);
        return redirect()->route('permissions.index');
    }

    public function destroy(Request $request)
    {
        $permission = Permission::findOrFail($request->segment(2));
        $permission->delete();
        return back();
    }
}
