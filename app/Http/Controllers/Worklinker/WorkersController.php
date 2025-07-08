<?php

namespace App\Http\Controllers\Worklinker;
use App\Http\Controllers\Controller;

use App\Models\User;
use App\Models\Workers;
use Illuminate\Http\Request;
use Inertia\Inertia;

class WorkersController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->input('search');
        $sort = $request->input('sort', 'fullName');
        $direction = $request->input('direction', 'asc');

        $workers = Workers::when($search, function ($query, $search) {
                $query->where(function ($q) use ($search) {
                    $q->where('fullName', 'like', "%{$search}%");
                });
            })
            ->orderBy($sort, $direction)
            ->paginate(15)
            ->withQueryString();

        return Inertia::render('Workers/Index', [
            'workers' => $workers,
            'filters' => $request->only(['search', 'sort', 'direction']),
        ]);
    }
}
