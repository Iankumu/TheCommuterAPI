<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Navigation extends Model
{
    protected $table = 'navigations';
   function navigation(){
       return $this->belongsTo('App\User');
   }
}
