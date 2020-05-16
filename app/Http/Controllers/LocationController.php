<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Location;
use App\Http\Requests;
use App\Http\Resources\Location as LocationResource;

class LocationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //get location coordinates
        $location = Location::paginate(10);

        //Return a collection of the coordinates
        return LocationResource::collection($location);
    }

    public function store(Request $request)
    {
        $location = $request->isMethod('put') ? Location::findOrFail ($request->id) : new Location;

        $location->id = $request->input('id');
        $location->latitude = $request->input('latitude');
        $location->longitude = $request->input('longitude');


        if($location->save())
        {
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
}
