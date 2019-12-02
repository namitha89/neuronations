<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Model\SessionHistory;

class Session extends Model
{
    //
    public function exerciseHistory(){

    	return $this->hasMany(SessionHistory::class, "session_id");
    }

}
