<?php

namespace App\Http\Controllers;



use App\Http\PostCaller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;

class NavigationController extends Controller
{
    public function store(Request $request)
    {
        $destinationLongitude = "36.0567195";
        $destinationLatitude = "-0.2954219";
        $email = "g@gmail.com";

//        $destinationLatitude = $request->input("destinationLatitude");
//        $destinationLongitude = $request->input("destinationLongitude");
//        $email = $request->input("email");


        $user_id = $this->getSingleUser($email);
        $currentLatitude = $this->getSingleUserLatitude($user_id);
        $currentLongitude = $this->getSingleUserLongitude($user_id);

        $response =  (new CallbackController)->index($currentLongitude, $currentLatitude, $destinationLongitude, $destinationLatitude);

//        return Redirect::action('NavigationController@receiveData',$response);
        return Redirect::route( 'mapbox' )->with( [ 'response' => $response ]);

//        return $response;

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

    public function receiveData(){
         $response=Session::get( 'response' );
         return response($response,200)->header('Content-Type',"application/json");
    }


}
