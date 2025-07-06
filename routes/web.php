<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\UserPermissionController;
use App\Http\Controllers\UserRoleController;

Route::get('/', function () {
    return Inertia::render('Welcome');
})->name('home');

// Route::get('dashboard', function () {
//     return Inertia::render('Dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('dashboard', fn() => Inertia::render('Dashboard'))->name('dashboard');

    Route::prefix('users')->name('users.')->group(function () {
        Route::get('/', [UsersController::class, 'index'])->name('index');

        Route::get('/{user}/roles', [UserRoleController::class, 'edit'])->name('roles.edit');
        Route::put('{user}/roles', [UserRoleController::class, 'update'])->name('roles.update');
        Route::get('/{user}/permissions', [UserPermissionController::class, 'edit'])->name('permissions.edit');
        Route::put('{user}/permissions', [UserRoleController::class, 'update'])->name('permissions.update');
    });

    Route::get('/map', function () {
        return Inertia::render('MapView');
    });


    Route::resource('roles', RolesController::class)->except('show');
    Route::resource('permissions', PermissionController::class)->except('show');
    Route::post('/roles/move-permission', [RolesController::class, 'movePermission']);


});


require __DIR__.'/settings.php';
require __DIR__.'/auth.php';
