<?php

namespace App\Http\Controllers\Worklinker;
use App\Http\Controllers\Controller;
use App\Models\Bid;
use App\Models\Jobs;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        $totalJobs = Jobs::count();

        $recentJobs = Jobs::latest()->take(5)->get();

        $activeUsers = User::where('id', '!=', Auth::id())->count();

        $applicationsToday = Bid::whereDate('created_at', today())->count();
        $applications = Bid::count();

        return Inertia::render('Dashboard/Index', [
            'totalJobs' => $totalJobs,
            'recentJobs' => $recentJobs,
            'stats' => [
                'activeUsers' => $activeUsers,
                'applicationsToday' => $applicationsToday,
                'applications' => $applications,
            ],
        ]);
    }
}
