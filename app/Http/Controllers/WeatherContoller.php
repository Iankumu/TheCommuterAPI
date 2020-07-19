<?php

namespace App\Http\Controllers;

use App\Location;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\TaskResource;
class WeatherContoller extends Controller
{
    public function apiConnect(Request $request){

        $id = Auth::user()->id;
        $apikey=env('OPEN_WEATHER_MAP');
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

        return new TaskResource($weather_data);
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
        return new TaskResource($weather_data);
    }


}
