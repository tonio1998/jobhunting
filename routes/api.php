<?php

use App\Http\Controllers\Api\BidsController;
use App\Http\Controllers\Api\ChatController;
use App\Http\Controllers\Api\JobsApiController;
use App\Http\Controllers\Api\RequirementController;
use App\Http\Controllers\Api\SkillsController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\VerificationController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Api\NotificationController;
use App\Http\Controllers\PublicVerificationController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\XenditController;
use App\Models\User;
use App\Models\WorkerProfile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

Broadcast::routes(['middleware' => ['auth:sanctum']]);
Route::post('/auth/google', [AuthController::class, 'loginWithGoogle']);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->get('/user/profile', function (Request $request) {
    return $request->user();
});

Route::middleware('auth:sanctum')->group(function () {
    Route::prefix('jobs')->name('jobs.')->group(function () {
        Route::get('/', [JobsApiController::class, 'index'])->name('index');
        Route::post('/', [JobsApiController::class, 'store'])->name('store');
        Route::get('{id}', [JobsApiController::class, 'show'])->name('show');
        Route::put('{id}', [JobsApiController::class, 'update'])->name('update');
        Route::delete('{id}', [JobsApiController::class, 'destroy'])->name('destroy');
        Route::post('list', [JobsApiController::class, 'list'])->name('add-student');
        Route::get('homeowner/{id}', [JobsApiController::class, 'homeownerJobs'])->name('homeowner-jobs');
        Route::post('add-favorite', [JobsApiController::class, 'addFavorite'])->name('add-favorite');
    });

    Route::prefix('skills')->name('skills.')->group(function () {
        Route::get('/', [SkillsController::class, 'index'])->name('index');
        Route::post('/', [SkillsController::class, 'store'])->name('store');
        Route::get('{id}', [SkillsController::class, 'show'])->name('show');
        Route::put('{id}', [SkillsController::class, 'update'])->name('update');
        Route::delete('{id}', [SkillsController::class, 'destroy'])->name('destroy');
        Route::get('worker/{id}', [SkillsController::class, 'workerSkills'])->name('worker-skills');
        Route::post('worker/add', [SkillsController::class, 'addSkillToWorker'])->name('add-skill-to-worker');
        Route::post('worker/remove', [SkillsController::class, 'removeSkillFromWorker'])->name('remove-skill-from-worker');
    });

    Route::prefix('bids')->name('bids.')->group(function () {
        Route::get('/', [BidsController::class, 'index'])->name('index');
        Route::post('/', [BidsController::class, 'store'])->name('store');
        Route::get('{id}', [BidsController::class, 'show'])->name('show');
        Route::put('{id}', [BidsController::class, 'update'])->name('update');
        Route::delete('{id}', [BidsController::class, 'destroy'])->name('destroy');
        Route::put('{id}/withdraw', [BidsController::class, 'withdrawBid'])->name('withdraw-bid');
        Route::get('jobs/workers', [BidsController::class, 'workersBids'])->name('workers-bids');
        Route::get('jobs/workers/{id}', [BidsController::class, 'workersBidsApplications'])->name('workers-bids-applications');
        Route::put('status/{BidID}/{newStatus}', [BidsController::class, 'newStatus']);
        Route::post('reviews', [BidsController::class, 'submitReview']);

        Route::post('contracts/sign', [BidsController::class, 'signContract'])->name('sign-contract');
        Route::get('contracts/{id}', [BidsController::class, 'contracts'])->name('contracts');
        Route::post('contracts/sms-code', [BidsController::class, 'sendSmsCode'])->name('send-sms-code');
        Route::post('contracts/sms-code/verify', [BidsController::class, 'verifySmsCode'])->name('verify-sms-code');
    });

    Route::prefix('user')->name('user.')->group(function () {
        Route::get('delete-account', [UserController::class, 'deleteAccount'])->name('delete-account');
        Route::get('/', [UserController::class, 'index'])->name('index');
        Route::post('/', [UserController::class, 'store'])->name('store');
        Route::get('{id}', [UserController::class, 'show'])->name('show');
        Route::put('{id}', [UserController::class, 'update'])->name('update');
        Route::delete('{id}', [UserController::class, 'destroy'])->name('destroy');
        Route::post('list', [UserController::class, 'list'])->name('add-student');
        Route::post('/{id}/{requirement_id}/upload', [UserController::class, 'uploadFile']);
        Route::get('/{id}/files', [UserController::class, 'getUserFiles']);
        Route::delete('files/{id}', [UserController::class, 'deleteUserFile']);
        Route::post('upload-requirement', [UserController::class, 'uploadUserRequirements']);
        Route::post('/{id}/profile-picture', [UserController::class, 'updateProfilePicture']);
        Route::post('/location', [UserController::class, 'saveLocation']);
        Route::put('/{id}/change-password', [UserController::class, 'changePassword']);
        Route::post('/role', [UserController::class, 'updateRole']);
        Route::get('/{id}/favorites', [UserController::class, 'getFavorites']);
        Route::post('/save-fcm-token', [UserController::class, 'saveFcmToken']);
        Route::delete('/{id}', [UserController::class, 'deleteAccount']);
    });

    Route::prefix('chats')->name('chats.')->group(function () {
        Route::get('/', [ChatController::class, 'listConversations']);
        Route::get('/{userId}', [ChatController::class, 'listMessages']);
        Route::post('/', [ChatController::class, 'sendMessage']);
        Route::put('/{id}', [ChatController::class, 'updateMessage']);
        Route::delete('/{id}', [ChatController::class, 'deleteMessage']);
        Route::post('/{id}/read', [ChatController::class, 'markAsRead']);
    });

    Route::prefix('requirements')->name('requirements.')->group(function () {
        Route::get('/', [RequirementController::class, 'index']);
        Route::get('{id}', [RequirementController::class, 'show']);
        Route::post('/', [RequirementController::class, 'store']);
        Route::put('{id}', [RequirementController::class, 'update']);
        Route::delete('{id}', [RequirementController::class, 'destroy']);
        Route::post('{id}/restore', [RequirementController::class, 'restore']);
        Route::get('{data}/details', [RequirementController::class, 'getRequirementsData']);
        Route::get('/{JobID}/{UserID}/files', [RequirementController::class, 'index_files']);
    });

    Route::prefix('verification')->name('verification.')->group(function () {
        Route::post('/send', [VerificationController::class, 'VerifysendOTP']);
        Route::post('/verify', [VerificationController::class, 'VerifyverifyOTP']);
    });

    Route::prefix('payment')->name('payment.')->group(function () {
        Route::post('/success', [PaymentController::class, 'success']);
        Route::post('/cancel', [PaymentController::class, 'cancel']);
        Route::post('/failure', [PaymentController::class, 'failure']);
        Route::post('/charge/logs', [PaymentController::class, 'logCharge']);
    });

    Route::post('/gcash/charge', [PaymentController::class, 'gcashCharge']);
    Route::post('/payment/xendit-webhook', [XenditController::class, 'handleWebhook']);
});

Route::prefix('verify')->name('verify.')->group(function () {
    Route::post('/forgot-password/send', [PublicVerificationController::class, 'sendForgotPasswordOTP']);
    Route::post('/forgot-password/verify', [PublicVerificationController::class, 'verifyOTP']);
});

Route::post('/notifications/send', [NotificationController::class, 'sendNotification']);

Route::post('/login', function (Request $request) {
    $validator = Validator::make($request->all(), [
        'email' => 'required|string',
        'password' => 'required|string',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'message' => 'Invalid input',
            'errors' => $validator->errors(),
        ], 422);
    }

    $user = User::with(['skills.skill', 'info'])
        ->where(function ($query) use ($request) {
            $query->where('email', $request->email)
                ->orWhere('phone_number', $request->email);
        })
        ->first();

    if (!$user) {
        return response()->json(['message' => 'User not found'], 401);
    }

    if (!Hash::check($request->password, $user->password)) {
        return response()->json(['message' => 'Incorrect password'], 401);
    }

    // Successful login
    return response()->json([
        'token' => $user->createToken('mobile')->plainTextToken,
        'user' => $user,
    ]);
});


Route::post('/register', function (Request $request) {
    $validated = $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|email|unique:users,email',
        'password' => 'required|string|min:6',
        'role' => 'required|string|max:30',
    ]);


    $user = User::create([
        'name' => $validated['name'],
        'email' => $validated['email'],
        'password' => Hash::make($validated['password']),
        'role' => $validated['role'],
    ]);

    WorkerProfile::updateOrCreate(
        ['UserID' => $user->id],
        ['email' => 1]
    );

    return response()->json([
        'token' => $user->createToken('mobile')->plainTextToken,
        'user' => $user
    ]);
});


Route::post('/auth/google', function (Request $request) {
    $request->validate([
        'token' => 'required|string',
        'name' => 'required|string',
        'email' => 'required|string',
        'photo' => 'nullable|string',
    ]);

    $googleResponse = Http::get('https://oauth2.googleapis.com/tokeninfo', [
        'id_token' => $request->token,
    ]);

    if (!$googleResponse->ok()) {
        return response()->json(['message' => 'Invalid Google ID token'], 401);
    }

    $googleUser = $googleResponse->json();

    $email = $googleUser['email'] ?? null;
    $name = $googleUser['name'] ?? $email ?? 'Google User';

    if (!$email) {
        return response()->json(['message' => 'Email not found in token'], 400);
    }

    $user = User::where('email', $email)->first();

    if ($user) {
        $user->name = $name;
        $user->avatar = $request->input('photo');
        $user->save();
    }else{
        $user = new User();
        $user->email = $email;
        $user->name = $name;
        $user->password = Hash::make($request->email);
        $user->avatar = $request->input('photo');
        $user->save();
    }

    return response()->json([
        'token' => $user->createToken('mobile')->plainTextToken,
        'user' => $user,
    ]);
});
