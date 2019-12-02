<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Model\Categories;
use App\Model\Exercise;
use App\Model\ExerciseHistory;
use App\Model\SessionHistory;
use App\Model\Session;
use App\Model\Users;
use Illuminate\Http\Response;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;


class HistoryTest extends TestCase
{
    /**
     * A basic unit test example.
     *
     * @return void
     */
    use WithoutMiddleware;

    public function test_can_display_history()
    {
        $users = factory(Users::class)->create();
        $categories = factory(Categories::class)->create();
        $exercise = factory(Exercise::class)->create();
        $session = factory(Session::class)->create();
        $session_history = factory(SessionHistory::class)->create();
        $exercise_history = factory(ExerciseHistory::class)->create();

         $this->get(route('history.show', $users->id)
            ->assertStatus(200)
            ->assertTrue(true)

        );
    }

   
}
