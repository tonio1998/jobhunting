<?php

namespace App\Http\Controllers;

use App\Models\Homeowner;
use App\Models\Workers;
use Illuminate\Http\Request;
use Inertia\Inertia;

class HomeownersController extends Controller
{
    public function index(Request $request)
    {
        return Inertia::render('Workers/Index');
    }

    public function fetch(Request $request)
    {
        $filters = $request->only('search', 'sort', 'direction');

        $allowedSorts = ['fullName', 'LastName', 'ContactNo', 'created_at'];
        $sort = in_array($filters['sort'] ?? '', $allowedSorts) ? $filters['sort'] : 'fullName';
        $direction = ($filters['direction'] ?? 'asc') === 'desc' ? 'desc' : 'asc';

        $guardians = Homeowner::when($filters['search'] ?? false, fn($q, $search) =>
        $q->where('fullName', 'like', "%$search%")
            ->orWhere('phoneNumber', 'like', "%$search%")
        )
            ->orderBy($sort, $direction)
            ->paginate(15);

        return response()->json($guardians);
    }
}
