<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;


class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:55',
            'email' => 'email|required',
            'password' => 'required|confirmed',

        ]);
        $validatedData['password'] = bcrypt($request->password);
        $user = User::create($validatedData);
        $accessToken = $user->createToken('authToken')->accessToken;
        return response(['user' => $user, 'access_token' => $accessToken],Response::HTTP_OK);//200

    }

    public function login(Request $request)
    {
        $loginData = $request->validate([

            'email' => 'email|required',
            'password' => 'required',

        ]);
        if (!auth()->attempt($loginData)) {
            return response(['message' => 'invalid credentials'],Response::HTTP_UNAUTHORIZED);//401

        }
        $user = Auth::user();
        if ($user->email_verified_at !== null) {
            $accessToken = auth()->user()->createToken('authToken')->accessToken;
            return response(['user' => auth()->user(), 'access_token' => $accessToken]);
        } else {
            return response()->json(['error' => 'email is not verified'], Response::HTTP_UNAUTHORIZED);//401
        }

    }
}
