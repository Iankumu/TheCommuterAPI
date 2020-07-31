<?php

namespace App\Http\Controllers;

use App\Location;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\WeatherResource;
use Illuminate\Support\Facades\Http;

class WeatherContoller extends Controller
{
    private  $apikey='707906ec3450c314df9e5f4ec92f72d1';
    public function apiConnect(Request $request){

        // $email = Auth::user()->email;
       $apikey = $this->apikey;
        $validator= $this->validate($request, [
            'longitude' => 'required|max:255',
            'latitude'=>'required|max:255'
        ]);
        // if ($validator->fails()) {


        //         return response()->json(array(
        //             'success' => false,
        //             'message' => 'There are incorect values in the form!',
        //             'errors' => $validator->getMessageBag()->toArray()
        //         ), 422);

        // }
        $lon=$request->input('longitude');
        $lat=$request->input('latitude');


        $url="https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&%20exclude=hourly,daily&appid=$apikey";
        $arr=file_get_contents($url);

        $apires=json_decode($arr);

        return $apires;

    }

    public function currentWeather(Request $request){
        //call to api
        $apiret=$this->apiConnect($request);

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

        return new WeatherResource($weather_data);
    }
    public function forecastWeather(Request $request){

        //call to api
        $apiret=$this->apiConnect($request);

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
        // return json_encode($weather_data);
        // return response()->json(['data'=>$weather_data]);
        return new WeatherResource($weather_data);
    }

    public function search(){
        $url="https://api.mapbox.com/geocoding/v5/mapbox.places/kisumu.json?access_token=pk.eyJ1IjoiYnJpYW5rYXJhbmphIiwiYSI6ImNrOWlrZ2syYTAzdWEzbXA1ZWF2MjhhOWUifQ.aK6j8l690k6E8hFQa9VYKQ";
        $response= Http::get("$url")->body();
        $data = json_decode($response,true);
        $coordinates=$data['features'][0]['geometry']['coordinates'];
        $longitude = $coordinates[0];
        $latitude = $coordinates[1];

        return $this->getWeather($latitude,$longitude);

    }

    public function getWeather($latitude,$longitude){
//        $url ="https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&%20exclude=hourly,daily&appid=$this->apikey";

        //The url below contains more current weather data including the city names
        $url ="https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$this->apikey";

        $arr=Http::get("$url")->body();
        $apiret=json_decode($arr,true);


        $city=$apiret['name'];
        $tempInK=$apiret['main']['temp']-273;
        $temp=(int)$tempInK;
        $feel=$apiret['main']['feels_like']-273;
        $feels_like=(int)$feel;
        $main=$apiret['weather'][0]['main'];
        $description=$apiret['weather'][0]['description'];
        $icon=$apiret['weather'][0]['icon'];

//        $city=$apiret->timezone;
//        $tempInK=$apiret->current->temp-273;
//        $temp=(int)$tempInK;
//        $feel=$apiret->current->feels_like-273;
//        $feels_like=(int)$feel;
//        $main=$apiret->current->weather[0]->main;
//        $description=$apiret->current->weather[0]->description;
//        $icon=$apiret->current->weather[0]->icon;
//
        $weather_data[] = array(
            "city"	=>  $city,
            "temp"	=>  $temp,
            "feels_like"  =>  $feels_like,
            "main"  =>  $main,
            "description" => $description,
            "icon"  =>  $icon,
        );
        return new WeatherResource($weather_data);
    }
}
