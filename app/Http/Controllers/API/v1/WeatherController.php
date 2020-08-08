<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use DateTime;
use Illuminate\Http\Request;
use App\Http\Resources\WeatherResource;
use Illuminate\Support\Facades\Http;

class WeatherController extends Controller
{
    private string $apikey = '707906ec3450c314df9e5f4ec92f72d1';

    //gets user's coordinates from an android device
    public function currentWeather(Request $request){

        $this->validate($request, [
            'longitude' => 'required|max:255',
            'latitude'=>'required|max:255'
        ]);
        $lon=$request->input('longitude');
        $lat=$request->input('latitude');

        return $this->getWeather($lat,$lon);

    }

    //used for fetching location coordinates from a search query
    public function search(Request $request){

        $this->validate($request, [
            'location' => 'required|max:255'
        ]);

        $location=$request->input('location');
        $mapbox_url="https://api.mapbox.com/geocoding/v5/mapbox.places/$location.json?access_token=pk.eyJ1IjoiYnJpYW5rYXJhbmphIiwiYSI6ImNrOWlrZ2syYTAzdWEzbXA1ZWF2MjhhOWUifQ.aK6j8l690k6E8hFQa9VYKQ";
        $response= Http::get("$mapbox_url")->body();
        $data = json_decode($response,true);
        $coordinates=$data['features'][0]['geometry']['coordinates'];
        $longitude = $coordinates[0];
        $latitude = $coordinates[1];

        return $this->getWeather($latitude,$longitude);

    }

    //the main function that decodes the open weather map json response
    public function getWeather($latitude,$longitude)
    {

        $apiret = $this->open_weather_current($latitude, $longitude);
        $forecast_data = $this->open_weather_forecast($latitude, $longitude);

        //decodes the json response to get the current weather
        $city = $apiret['name'];
        $tempInK = $apiret['main']['temp'] - 273;
        $temp = (int)$tempInK;
        $feel = $apiret['main']['feels_like'] - 273;
        $feels_like = (int)$feel;
        $main = $apiret['weather'][0]['main'];
        $description = $apiret['weather'][0]['description'];
        $icon = $apiret['weather'][0]['icon'];

        $current_weather_data[] = array(
            "city" => $city,
            "temp" => $temp,
            "feels_like" => $feels_like,
            "main" => $main,
            "description" => $description,
            "icon" => $icon,
        );
        //decodes the json response to get the 7 day weather forecast
        for ($i = 1; $i <= 7; $i++) {
            $unixTimestamp = $forecast_data->daily[$i]->dt;
            $datetime = new DateTime("@$unixTimestamp");
            $date = $datetime->format('l');
            $tempInK = $forecast_data->daily[$i]->temp->day - 273;
            $temp = (int)$tempInK;
            $feel = $forecast_data->daily[$i]->feels_like->day - 273;
            $feels_like = (int)$feel;
            $main = $forecast_data->daily[$i]->weather[0]->main;
            $description = $forecast_data->daily[$i]->weather[0]->description;
            $icon = $forecast_data->daily[$i]->weather[0]->icon;

            $forecast_weather_data[] = array(
                "date" => $date,
                "temp" => $temp,
                "feels_like" => $feels_like,
                "main" => $main,
                "description" => $description,
                "icon" => $icon,
            );
        }
        $final_weather_data = array_merge($current_weather_data,$forecast_weather_data);
        return new WeatherResource($final_weather_data);
    }

    //gets the current weather of a place from open weather map api
    public function open_weather_current($latitude,$longitude){
        $current_weather_url ="https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$this->apikey";
        $current = Http::get("$current_weather_url")->body();
        return json_decode($current,true);

    }

    //get the 7 day weather forecast of a place from open weather map api
    public function open_weather_forecast($latitude,$longitude){
        $one_call_url="https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&%20exclude=hourly,daily&appid=$this->apikey";
        $arr=file_get_contents($one_call_url);
        return json_decode($arr);
    }
}
