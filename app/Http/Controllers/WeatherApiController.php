<?php

namespace App\Http\Controllers;
use App\Location;

use Illuminate\Http\Request;
use DateTime;

//tried this to get location functions from locationController
//app(LocationController::class)->show($id);

class WeatherApiController extends Controller
{
    public function apiConnect($id){
        // receive coordinates parameter
        $apikey='707906ec3450c314df9e5f4ec92f72d1';
        $location = Location::findOrFail($id);
        $lat = $location->latitude;
        $lon = $location->longitude;
        $url="https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&%20exclude=hourly,daily&appid=$apikey";
        $arr=file_get_contents($url);
        //api return values
        $apires=json_decode($arr);
        
        return $apires;
    }
    public function currentWeather($id){
        //call to api
        $apiret=$this->apiConnect($id);
        
        //check site below for api parameter list
        //https://openweathermap.org/api/one-call-api

        //below are parameters that I picked as most useful

        //current weather condition data populated into array
        $city=$apiret->timezone;
        $tempInK=$apiret->current->temp-273;
            $temp=(int)$tempInK;
        $feel=$apiret->current->feels_like-273;
            $feels_like=(int)$feel;
        $main=$apiret->current->weather[0]->main;
        $description=$apiret->current->weather[0]->description;
        $icon=$apiret->current->weather[0]->icon;

        $weather_data[] = array(
            "city"	=>  $city,
            "temp"	=>  $temp,
            "feels_like"  =>  $feels_like,
            "main"  =>  $main,
            "description" => $description,
            "icon"  =>  $icon,
        );
        return json_encode($weather_data);     

    }
    public function forcastWeather($id){

        //call to api
        $apiret=$this->apiConnect($id);

        //7 day weather data from api populated into array
        for($i=1; $i<=7; $i++){
            $unixTimestamp=$apiret->daily[$i]->dt;
                $datetime = new DateTime("@$unixTimestamp");
                $date = $datetime->format('l');
            $tempInK=$apiret->daily[$i]->temp->day-273;
                $temp=(int)$tempInK;
            $feel=$apiret->daily[$i]->feels_like->day-273;
                $feels_like=(int)$feel;
            $main=$apiret->daily[$i]->weather[0]->main;
            $description=$apiret->daily[$i]->weather[0]->description;
            $icon=$apiret->daily[$i]->weather[0]->icon;

            $weather_data[] = array(
                "date"  =>  $date,
                "temp"	=>  $temp,
                "feels_like"  =>  $feels_like,
                "main"  =>  $main,
                "description" => $description,
                "icon"  =>  $icon,
            );       
        }        
        return json_encode($weather_data);
    }
}
