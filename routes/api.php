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

//List Location cordinates
Route::get('location','LocationController@index');

//list a single user location 
Route::get('location/{id}','LocationController@show');

//create location values
Route::post('location','LocationController@store');
    
//update location coordinates
Route::put('location/{id}','LocationController@store');

//delete the location values

Route::delete('location/{id}','LocationController@destroy');

//current weather
Route::get('currentWeather/{id}', 'WeatherApiController@currentWeather');
//weather forcast
Route::get('forcastWeather/{id}', 'WeatherApiController@forcastWeather');

