<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Task;
use Faker\Generator as Faker;

$factory->define(Task::class, function (Faker $faker) {
    return [
       'title'=>$faker->company,
       'descritpion'=>$faker->paragraph(20),
       'user_id'=>'1'
    ];
});
