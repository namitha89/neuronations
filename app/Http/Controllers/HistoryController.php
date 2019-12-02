<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use DB;
use App\Model\Categories;
use App\Model\Exercise;
use App\Model\ExerciseHistory;
use App\Model\Session;
use App\Model\Users;
use App\Http\Resources\UserScoreResource;
use Illuminate\Support\Facades\Redis;

class HistoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // display the score of user based on session
        $redis = Redis::connection();
        $results = Redis::get('user:score:'.$id);
        if(empty($user_score)){

            $results = DB::table('exercise_history')
            ->leftjoin('session_history', 'exercise_history.session_history_id', '=', 'session_history.id')
            ->leftjoin('users', 'session_history.user_id', '=', 'users.id')
            ->leftjoin('session', 'session_history.session_id', '=', 'session.id')
            ->select('session.date','session_history.session_id', DB::raw('SUM(exercise_history.points) as score'))
            ->where('session_history.user_id', $id)
            ->groupBy('session_history.session_id')
            ->orderBy('session.date', 'desc')
            ->limit(12)
            ->get();

            Redis::set('user:score:'.$id, $results);

        }

        Redis::expire('user:score:'.$id, 1);
        return UserScoreResource::collection($results);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
