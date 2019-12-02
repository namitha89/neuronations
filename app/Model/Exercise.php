<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Model\Categories;

class Exercise extends Model
{
    //
    public function categories(){

    	return $this->belongsTo('App\Model\Categories',"category_id");
    }

    public function gethistory(){

    	return $this->hasMany(ExerciseHistory::class, "exercise_id");
    
}
