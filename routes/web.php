<?php

use App\Http\Controllers\Worklinker\DashboardController;
use App\Http\Controllers\Worklinker\WorkersController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\Worklinker\UsersController;
use App\Http\Controllers\Worklinker\RolesController;
use App\Http\Controllers\Worklinker\PermissionController;
use App\Http\Controllers\Worklinker\UserPermissionController;
use App\Http\Controllers\Worklinker\UserRoleController;

Route::get('/', function () {
    return Inertia::render('Welcome');
})->name('home');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::prefix('dashboard')->name('dashboard.')->group(function () {
        Route::get('/', [DashboardController::class, 'index'])->name('index');
    });

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

    Route::prefix('roles')->name('roles.')->group(function () {
        Route::get('/', [RolesController::class, 'index'])->name('index');
        Route::post('/', [RolesController::class, 'store'])->name('store');
        Route::get('/{role}/edit', [RolesController::class, 'edit'])->name('edit');
        Route::delete('/{role}', [RolesController::class, 'destroy'])->name('destroy');
        Route::put('/{role}/update', [RolesController::class, 'update'])->name('update');
        Route::get('/{role}/permissions', [RolesController::class, 'editPermissions']);
        Route::put('/{role}/permissions', [RolesController::class, 'updatePermissions'])->name('permissions.update');
    });

    Route::prefix('permissions')->name('permissions.')->group(function () {
        Route::get('/', [PermissionController::class, 'index'])->name('index');
        Route::get('/create', [PermissionController::class, 'create'])->name('create');
        Route::post('/store', [PermissionController::class, 'store'])->name('store');
        Route::get('/{permissions}/edit', [PermissionController::class, 'edit'])->name('edit');
        Route::delete('/{permissions}', [PermissionController::class, 'destroy'])->name('destroy');
        Route::put('/{permissions}/update', [PermissionController::class, 'update'])->name('update');
    });

    Route::prefix('workers')->name('workers.')->group(function () {
        Route::get('/', [WorkersController::class, 'index'])->name('index');
    });


});


require __DIR__.'/settings.php';
require __DIR__.'/auth.php';
