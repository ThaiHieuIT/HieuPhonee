<?php

use App\Admin\Controllers\HomeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\StripeController;
use App\Http\Controllers\VnpayController;
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
// Route::get('/product/{id}', [App\Http\Controllers\HomeController::class, 'addCart']);
// Route::get('/cart', [App\Http\Controllers\HomeController::class, 'cart']);
// Route::get('/cart/{id}', [App\Http\Controllers\HomeController::class, 'deleteCart']);
// Route::patch('update-cart', [\App\Http\Controllers\HomeController::class, 'update'])->name('update_cart');

Route::get('cart', [OrderController::class, 'cart'])->name('cart');
Route::get('add-to-cart/{id}', [OrderController::class, 'addToCart'])->name('add_to_cart');
Route::patch('update-cart', [OrderController::class, 'update'])->name('update_cart');
Route::delete('remove-from-cart', [OrderController::class, 'remove'])->name('remove_from_cart');
Route::post('/session', [StripeController::class, 'session'])->name('session');
Route::get('/success', [StripeController::class, 'success'])->name('success');
Route::get('/cancel', [StripeController::class, 'cancel'])->name('cancel');
Route::post('/vnpay_payment', [VnpayController::class, 'vnpay_payment'])->name('vnpay');
Route::get('/thank-you', [VnpayController::class, 'thank_you']);
