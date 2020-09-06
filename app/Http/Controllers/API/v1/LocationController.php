<?php

namespace App\Http\Controllers\API\v1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Location;
use App\Http\Resources\LocationResource as LocationResource;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class LocationController extends Controller
{
    public function index()
    {
        //get location coordinates
        $location = Location::paginate(10);

        //Return a collection of the coordinates
        return LocationResource::collection($location)
            ->response()
            ->setStatusCode(Response::HTTP_OK);//200
    }

    public function store(Request $request)
    {

        $location =  new Location;
        $email=Auth::user()->email;
        $user_id =$this->getSingleUser($email);

        $location->latitude = $request->input('latitude');
        $location->longitude = $request->input('longitude');
        $location->user_id=$request->input('user_id',"$user_id");

        $check =$this->checkIfExists($user_id);

        if ($check<1){
            $location->save();
        }
        else
        {
            DB::table('locations')->where('user_id', $user_id)->update([
                'latitude'=>$location->latitude,
                'longitude'=>$location->longitude
            ]);
        }
        return (new LocationResource($location))
            ->response()
            ->setStatusCode(Response::HTTP_CREATED);//201
    }

    public function getSingleUser($email){

        $result = DB::table('users')->select('id')->where('email', $email)->first();

        return $result->id;
    }
    public function checkIfExists($user_id){

        return DB::table('locations')->where('user_id',$user_id)->count();

    }

}
