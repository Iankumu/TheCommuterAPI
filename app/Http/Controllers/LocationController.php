<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Location;
use App\Http\Resources\LocationResource as LocationResource;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
class LocationController extends Controller
{
    public function index()
    {
        //get location coordinates
        $location = Location::paginate(10);

        //Return a collection of the coordinates
        return LocationResource::collection($location);
    }

    public function store(Request $request)
    {

        $location = $request->isMethod('PUT') ? Location::findOrFail ($request->id) : new Location;

        $email=Auth::user()->email;
        $user_id =$this->getSingleUser($email);

        $location->id = $request->input('id');
        $location->latitude = $request->input('latitude');
        $location->longitude = $request->input('longitude');
        $location->user_id=$request->input('user_id',"$user_id");

        $check_user =$this->checkIfExists($user_id);

        if ($check_user<1){
            $location->save();
        }
        else
        {
            DB::table('locations')->where('user_id', $user_id)->update(['latitude'=>$location->latitude,
                'longitude'=>$location->longitude]);
        }
        return new LocationResource($location);
    }

    public function getSingleUser($email){

        $result = DB::table('users')->select('id')->where('email', $email)->first();

        return $result->id;
    }
    public function checkIfExists($user_id){

        $user = DB::table('locations')->where('user_id',$user_id)->count();
        return $user;

    }

}
