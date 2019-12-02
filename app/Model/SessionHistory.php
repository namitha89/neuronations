<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Model\Session;
use App\Model\Users;

class SessionHistory extends Model
{
    //
    public function getUser(){

    	return $this->belongsTo(Users::class, "user_id");
    }

    public function getSession(){

    	return $this->belongsTo(Session::class, "session_id");
    }

    public function getexercise(){

    	return $this->hasMany(ExerciseHistory::class, "session_history_id");
    }
}
