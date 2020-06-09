<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('/verified-only', function (Request $request) {
    dd('you are verified', $request->user()->name);
})->middleware('auth:api', 'verified');

Route::post('/login', 'API\AuthController@login');
Route::post('/register', 'API\AuthController@register');

//request to reset password...=>gives token  to eneble password reset..requres just the email as part of the body
Route::post('/password/requestpassreset', 'API\ForgotPasswordController@sendResetLinkEmail');

//use the token given to reset the password to reset the password..requires password , password_confirmation, email ,and email provided token to reset
Route::post('/password/reset', 'API\ResetPasswordController@reset');

//sends an email to verify your email
Route::get('/email/verifysend', 'API\VerificationController@resend')->name('verification.resend');

//back up link incase the verify send route gives users trouble to verify...it will sent by default as an autofilled link contained in the email
Route::get('/email/verify/{id}/{hash}', 'API\VerificationController@verify')->name('verification.verify');

//group of routes related to the to do list
Route::apiResource('tasks', 'API\TasksController')->middleware('auth:api');
