<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Model\Exercise;

class Categories extends Model
{
    //
    public function exercise(){

    	return $this->hasMany(Exercise::class, "category_id");
    }
    
}
