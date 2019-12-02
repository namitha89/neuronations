<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Model\Session;

class Users extends Model
{
    //
    public function exerciseHistory(){

    	return $this->hasMany(ExerciseHistory::class, "user_id");
    }
}
