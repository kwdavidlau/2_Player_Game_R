require './game_functions'
LIVES = 3
UPPER_LIMIT = 20
@player1_lives, @player2_lives = LIVES, LIVES
@game_playing = true

while @game_playing
    #Ask one person, they put their answer, evaluate true or false
    @scenario = 1
    generate_question #comes up with random numbers
    prompt_player_for_answer
    verify_answer
    break if (@player1_lives == 0 || @player2_lives == 0)

    @scenario = 2
    generate_question
    prompt_player_for_answer
    verify_answer
    @game_playing = false if (@player1_lives == 0 || @player2_lives == 0)
end
