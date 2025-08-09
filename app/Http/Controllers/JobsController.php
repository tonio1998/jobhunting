<?php

namespace App\Http\Controllers;

use App\Models\Jobs;
use App\Traits\TCommonFunctions;
use Inertia\Inertia;

class JobsController extends Controller
{
    use TCommonFunctions;
    public function index()
    {
        return Inertia::render('Jobs/Index');
    }

    public function fetch()
    {
        $jobs = Jobs::with(['homeowner', 'applicants', 'skills_required.skill'])->orderBy('created_at', 'desc')->paginate(15);
        return response()->json($jobs);
    }

    public function fetchJobDetails($id)
    {
        $job = Jobs::with(['homeowner', 'applicants', 'skills_required.skill'])->where('id', $id)->first();
        return Inertia::render('Jobs/JobDetails', [
            'job' => $job,
        ]);
    }

    public function showApplication($id)
    {
        $job = Jobs::with(['homeowner', 'applicants', 'skills_required.skill'])->where('id', $id)->first();
        return Inertia::render('Applicantions/Details', [
            'job' => $job,
        ]);
    }

    public function show($id)
    {
        $job = Jobs::with(['homeowner', 'applicants', 'skills_required.skill'])->where('id', $id)->first();
        return response()->json($job);

    }

}
