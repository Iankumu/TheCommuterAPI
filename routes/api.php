<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
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

//request to reset password...=>gives token  to enable password reset..requires just the email as part of the body
Route::post('/password/requestpassreset', 'API\ForgotPasswordController@sendResetLinkEmail');

//use the token given to reset the password to reset the password..requires password , password_confirmation, email ,and email provided token to reset
Route::post('/password/reset', 'API\ResetPasswordController@reset');

//sends an email to verify your email
Route::get('/email/verifysend', 'API\VerificationController@resend')->name('verification.resend');

//back up link incase the verify send route gives users trouble to verify...it will sent by default as an autofilled link contained in the email
Route::get('/email/verify/{id}/{hash}', 'API\VerificationController@verify')->name('verification.verify');

//group of routes related to the to do list
Route::apiResource('v1/tasks', 'API\v1\TasksController')->middleware('auth:api');


//get data from android side using the post method
Route::post('v1/currentWeather','API\v1\WeatherController@currentWeather')->middleware('auth:api');

//List Location coordinates
Route::get('v1/location','API\v1\LocationController@index');

//create location values
Route::post('v1/location','API\v1\LocationController@store')->middleware('auth:api');

//receive parameters from android
Route::post('v1/navigation','API\v1\NavigationController@store')->middleware('auth:api');

//get GeoJson data from mapbox using get request and return the GeoJson object to android
Route::get('v1/navigation','API\v1\NavigationController@index')->middleware('auth:api');

//return destination coordinates to android to help build the navigation launcher
Route::get('v1/coordinates','API\v1\NavigationController@getCoordinates')->middleware('auth:api');

//profile
// Route::get('profile', ['middleware' => 'auth:api', 'uses' => 'API\UsersController@updateProfile']);
Route::apiResource('v1/profile', 'API\v1\UsersController')->middleware('auth:api');

//returns search results for the current weather of a certain location
Route::post('v1/searchWeather','API\v1\WeatherController@search')->middleware('auth:api');
