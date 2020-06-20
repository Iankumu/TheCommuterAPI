<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Location;
use App\Http\Resources\LocationResource as LocationResource;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;

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

        $email = $request->input("email");

//        $email ="g@gmail.com";

        $user_id =$this->getSingleUser($email);

        $location->id = $request->input('id');
        $location->latitude = $request->input('latitude');
        $location->longitude = $request->input('longitude');
        $location->user_id=$request->input('user_id',"$user_id");

//        $check_user =$this->checkIfExists($user_id);

//        DB::table('locations')->where('user_id', $user_id)->update('votes' => 1);



        if($location->save()){
           return new LocationResource($location);
        }

    }

    public function show($id)
    {
        //Get a single location value
        $location = Location::findOrFail($id);

        //Return the single location as a resource
        return new LocationResource($location);
    }
    public function destroy($id)
    {
        //Get a single location value
        $location = Location::findOrFail($id);

        if($location->delete()){
        return new LocationResource($location);
        }
    }

    public function getSingleUser($email){

        $result = DB::table('users')->select('id')->where('email', $email)->first();

        return $result->id;
    }

//    public function checkIfExists($user_id){
//
//        $user = DB::table('locations')->where('user_id', '=',$user_id)->first();
//
//
//        return $user->id;
//    }
}
