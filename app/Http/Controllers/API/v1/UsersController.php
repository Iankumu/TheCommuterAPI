<?php

namespace App\Http\Controllers\API\v1;

use Illuminate\Http\Request;
use App\User;
use App\Http\Resources\UsersResource;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class UsersController extends Controller
{

    public function index()
    {  $id = Auth::user()->id;
        if (Auth::user())
        {
            $user=User::all()->where('id',$id);
            return (new UsersResource($user))
                ->response()
                ->setStatusCode(Response::HTTP_OK);//200
        }

    }

    public function update(Request $request, User $user)
    {
        $request->validate([
            'name' => 'required|max:55',
            'email' => 'email|required',

        ]);
        $input = $request->all();

        $user->update($input);
        return response()->json(['data'=>$user],Response::HTTP_OK);//200
    }


    public function destroy($id)
    {
        //
    }
}
