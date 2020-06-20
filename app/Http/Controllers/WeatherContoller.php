<?php

namespace App\Http\Controllers;

use App\Location;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class WeatherContoller extends Controller
{
    public function apiConnect(){
        // receive coordinates parameter
        $apikey='707906ec3450c314df9e5f4ec92f72d1';

//        $email = "g@gmail.com";
        $email = $this->getPostData();
        $user_id = $this->getSingleUser($email);

        $lat=$this->getSingleUserLatitude($user_id);
        $lon=$this->getSingleUserLongitude($user_id);

//        $lat = $location->latitude;
//        $lon = $location->longitude;
        $url="https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&%20exclude=hourly,daily&appid=$apikey";
        $arr=file_get_contents($url);
        //api return values
        $apires=json_decode($arr);

        return $apires;
    }
    public function currentWeather(){
        //call to api
        $apiret=$this->apiConnect();

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
    public function forcastWeather(){

        //call to api
        $apiret=$this->apiConnect();

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

    public function getSingleUser($email){

        $result = DB::table('users')->select('id')->where('email', $email)->first();

        return $result->id;
    }
    public function getSingleUserLatitude($user_id){

        $result = DB::table('locations')->select('latitude')->where('user_id', $user_id)->first();
        return $result->latitude;
    }
    public function getSingleUserLongitude($user_id){

        $result = DB::table('locations')->select('longitude')->where('user_id', $user_id)->first();


        return $result->longitude;
    }

    public function getPostData(){
        //you can get the email from the android sharedprefs
        return Request::input("email");

    }
}
