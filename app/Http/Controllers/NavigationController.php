<?php

namespace App\Http\Controllers;

use App\Http\Resources\NavigationResource;
use App\Navigation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;


class NavigationController extends Controller
{
    private $access_token ="pk.eyJ1IjoiaWFua3VtdSIsImEiOiJjazlsYm94am8xYXJ0M2txNnNtdWJldjhpIn0.5R5ZniWxnkTUYkztu7iAYQ";

    public function store(Request $request)
    {
        $destinationLatitude = $request->input("destinationLatitude");
        $destinationLongitude = $request->input("destinationLongitude");
        $email = Auth::user()->email;

        $user_id = $this->getSingleUser($email);
        $currentLatitude = $this->getSingleUserLatitude($user_id);
        $currentLongitude = $this->getSingleUserLongitude($user_id);

        $navigation = new Navigation;
        $navigation->current_latitude = $currentLatitude;
        $navigation->current_longitude = $currentLongitude;
        $navigation->destination_latitude = $destinationLatitude;
        $navigation->destination_longitude = $destinationLongitude;
        $navigation->user_id=$request->input('user_id',"$user_id");

        $check =$this->checkIfExists($user_id);

        if ($check<1){
            $navigation->save();
        }
        else
        {
            DB::table('navigations')->where('user_id', $user_id)->update([
                'current_latitude'=>$navigation->current_latitude,
                'current_longitude'=>$navigation->current_longitude,
                'destination_latitude'=>$navigation->destination_latitude,
                'destination_longitude'=>$navigation->destination_longitude,
            ]);
        }

        return new NavigationResource($navigation);

    }

    public  function index()
    {
        $email = Auth::user()->email;

        $user_id = $this->getSingleUser($email);
        $currentLatitude = $this->getCurrentLatitude($user_id);
        $currentLongitude = $this->getCurrentLongitude($user_id);

        $destinationLatitude = $this->getDestinationLatitude($user_id);
        $destinationLongitude = $this->getDestinationLongitude($user_id);

        $access_token = $this->access_token;
        $url = "https://api.mapbox.com/directions/v5/mapbox/driving/".$currentLongitude.','.$currentLatitude.';'.$destinationLongitude.','.$destinationLatitude.'?alternatives=true&steps=true&banner_instructions=true&voice_instructions=true&voice_units=metric&geometries=geojson&access_token=' .$access_token;

        return Http::get("$url")->json();

    }

    public function getCoordinates(){
        $email = Auth::user()->email;
        $user_id = $this->getSingleUser($email);
        $currentLatitude = $this->getCurrentLatitude($user_id);
        $currentLongitude = $this->getCurrentLongitude($user_id);

        $destinationLatitude = $this->getDestinationLatitude($user_id);
        $destinationLongitude = $this->getDestinationLongitude($user_id);

        $array = [$currentLatitude,$currentLongitude,$destinationLatitude,$destinationLongitude];

        return new NavigationResource($array);

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

    public function getCurrentLatitude($user_id){

        $result = DB::table('navigations')->select('current_latitude')->where('user_id', $user_id)->first();
        return $result->current_latitude;
    }
    public function getCurrentLongitude($user_id){

        $result = DB::table('navigations')->select('current_longitude')->where('user_id', $user_id)->first();
        return $result->current_longitude;
    }

    public function getDestinationLatitude($user_id){

        $result = DB::table('navigations')->select('destination_latitude')->where('user_id', $user_id)->first();
        return $result->destination_latitude;
    }
    public function getDestinationLongitude($user_id){

        $result = DB::table('navigations')->select('destination_longitude')->where('user_id', $user_id)->first();
        return $result->destination_longitude;
    }

    public function checkIfExists($user_id){

        return DB::table('navigations')->where('user_id',$user_id)->count();

    }



}
