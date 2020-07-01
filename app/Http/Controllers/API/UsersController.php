<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\User;
use App\Http\Resources\UsersResource;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {  $id = Auth::user()->id;
        if (Auth::user())
        {
            $user=User::all()->where('id',$id);
            return response()->json(['data'=>$user]);
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
            return response()->json(['data'=>$user]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
