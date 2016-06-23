
def generate_question
  @randnum, @randnum2 = 1+rand(UPPER_LIMIT), 1+rand(UPPER_LIMIT)
end

def prompt_player_for_answer
  puts "Player #{@scenario}: What does #{@randnum} + #{@randnum2} = ?"
  @guess = (gets.chomp).to_i
end


def verify_answer
  if @guess != (@randnum + @randnum2)
    @player1_lives-=1 if @scenario == 1
    @player2_lives-=1 if @scenario == 2
    puts "WRONG, Player1: #{@player1_lives}, Player2: #{@player2_lives}"
  else
    puts "good job, Player1: #{@player1_lives}, Player2: #{@player2_lives}"
  end
end



# def prompt_player_for_answer
#   if @scenario == 1
#     puts "Player 1: What does #{@randnum} + #{@randnum2}"
#     @guess = (gets.chomp).to_i
#   else
#     puts "Player 2: What does #{@randnum} + #{@randnum2}"
#     @guess = (gets.chomp).to_i
#   end
# end
