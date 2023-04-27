<?php

use Faker\Guesser\Name;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [App\Http\Controllers\FrontendController::class, 'index']);
Route::get('/category/{id}', [App\Http\Controllers\FrontendController::class, 'categoryDetaill']);
Route::get('/productdetail/{id}', [App\Http\Controllers\FrontendController::class, 'productdetail'])->name('product.detail');
Route::get('/search', [App\Http\Controllers\FrontendController::class, 'search'])->name('search');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/product/{id}', [App\Http\Controllers\HomeController::class, 'addCart']);
Route::get('/cart', [App\Http\Controllers\HomeController::class, 'cart']);
Route::get('/cart/{id}', [App\Http\Controllers\HomeController::class, 'deleteCart']);
