<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Model\Exercise;
use App\Model\Session;

class ExerciseHistory extends Model
{
    //
    public function getExercise(){

    	return $this->belongsTo(Exercise::class, "exercise_id");
    }

    public function getSession(){

    	return $this->belongsTo(Session::class, "session_id");
    }

    public function getUsers(){

    	return $this->belongsTo(Users::class, "users_id");
    }
}
