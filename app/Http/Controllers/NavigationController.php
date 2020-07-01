<?php

namespace App\Http\Controllers;




use App\Navigation;
use http\Env\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Redirect;
use Symfony\Component\Console\Input\Input;


class NavigationController extends Controller
{
    private $access_token = "pk.eyJ1IjoiaWFua3VtdSIsImEiOiJjazlsYm94am8xYXJ0M2txNnNtdWJldjhpIn0.5R5ZniWxnkTUYkztu7iAYQ";

    private $currentLatitude;
    private $currentLongitude;
    private $destinationLongitude;
    private $destinationLatitude;

    public function store(Request $request)
    {



//        $destinationLongitude = "36.0567195";
//        $destinationLatitude = "-0.2954219";
//        $email = "g@gmail.com";

        $destinationLatitude = $request->input("destinationLatitude");
        $destinationLongitude = $request->input("destinationLongitude");
        $email = $request->input("email");
//
        $user_id = $this->getSingleUser($email);
        $currentLatitude = $this->getSingleUserLatitude($user_id);
        $currentLongitude = $this->getSingleUserLongitude($user_id);


//        $currentLatitude = "-0.2973409";
//        $currentLongitude = "36.0572262";
//        $destinationLongitude = "36.0567195";
//        $destinationLatitude = "-0.2954219";

        $navigation = new Navigation;
        $navigation->current_location = $currentLatitude;
        $navigation->current_longitude = $currentLongitude;
        $navigation->destination_latitude = $destinationLatitude;
        $navigation->destination_longitude = $destinationLongitude;
        $navigation->user_id=$request->input('user_id',"$user_id");

        $navigation->save();





//        $this->destinationLatitude = (string)$destinationLatitude;
//        $this->destinationLongitude = (string)$destinationLongitude;

//        $this->currentLatitude = (string)$currentLatitude;
//        $this->currentLongitude = (string)$currentLongitude;

//        return redirect()->route("mapbox",[
//            'currentLatitude'=>$currentLatitude,
//            'currentLongitude'=>$currentLongitude,
//            'destinationLongitude'=>$destinationLongitude,
//            'destinationLatitude'=>$destinationLatitude]);

    }


    public  function index()
    {

//        $result=DB::table('navigations')->select('current_latitude', 'current_longitude', 'destination_latitude','destination_longitude')->get();


//        $email = "g@gmail.com";

//        $user_id = $this->getSingleUser($email);
//        $currentLatitude = $this->getSingleUserLatitude($user_id);
//        $currentLongitude = $this->getSingleUserLongitude($user_id);
//


        $currentLatitude = "-0.2973409";
        $currentLongitude = "36.0572262";
        $destinationLongitude = "36.0567195";
        $destinationLatitude = "-0.2954219";

//        $currentLatitude = "";
//        $currentLongitude = "";


//        $currentLongitude = $this->currentLongitude;
//        $currentLatitude = $this->currentLatitude;

        $url = "https://api.mapbox.com/directions/v5/mapbox/driving/".$currentLongitude.','.$currentLatitude.';'.$destinationLongitude.','.$destinationLatitude.'?alternatives=true&steps=true&voice_instructions=true&banner_instructions=true&voice_units=metric&geometries=geojson&access_token=' . $this->access_token;

        return Http::get("$url")->json();

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



}
