<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    Protected $fillable=['title','descritpion','due'];
    protected $guarded=['user_id'];
    public function creator()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

}
