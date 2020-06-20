<?php

namespace App\Http\Controllers;



use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;

class NavigationController extends Controller
{

    private $response;

    public function store(Request $request)
    {

//        $currentLatitude = "-0.2971293";
//        $currentLongitude = "36.0572179";
        $destinationLongitude = "36.0567195";
        $destinationLatitude = "-0.2954219";
//        $destinationLatitude = $request->input("destinationLatitude");
//        $destinationLongitude = $request->input("destinationLongitude");

//        $email = $request->input("email");

        $email = "g@gmail.com";

        $user_id=$this->getSingleUser($email);

        $currentLatitude = $this->getSingleUserLatitude($user_id);
        $currentLongitude = $this->getSingleUserLongitude($user_id);

        $this->response= (new CallbackController)->index($currentLongitude,$currentLatitude,$destinationLongitude,$destinationLatitude);

        return  $this->response;

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

//    public function index(){
//
//
//
//    }
}
