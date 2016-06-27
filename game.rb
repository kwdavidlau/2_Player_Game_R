# require './game_functions'
# LIVES = 3
# UPPER_LIMIT = 20
# @player1_lives, @player2_lives = LIVES, LIVES
# @game_playing = true
#
# while @game_playing
#     #Ask one person, they put their answer, evaluate true or false
#     @scenario = 1
#     generate_question #comes up with random numbers
#     prompt_player_for_answer
#     verify_answer
#     break if (@player1_lives == 0 || @player2_lives == 0)
#
#     @scenario = 2
#     generate_question
#     prompt_player_for_answer
#     verify_answer
#     @game_playing = false if (@player1_lives == 0 || @player2_lives == 0)
# end

require 'colorize'
UPPER_LIMIT = 20

class Player
  attr_accessor :name, :lives, :points
  def initialize(options={})
    @name = options[:name]
    @lives  = options[:lives]
    @points = options[:points]
  end

  def gain_point
    @points += 1
    puts "Good Job! #{@name}, you have #{@lives} lives and #{@points} points".green
  end

  def lose_life
    @lives -= 1
    puts "You can't add. #{@name}, you have #{@lives} lives and #{@points} points".red
  end
end

def getting_names
  @list_of_players = []
  getting_players = true
  counter = 0
  while getting_players
    puts "What's Player#{counter+1}'s name?"
    name = gets.chomp
    if name == "done"
      puts "Ok you have listed #{counter} players"
      break
    end
    @list_of_players << Player.new(name: "#{name}", lives: 3, points: 0)
    counter +=1
  end
end

def game_start
  @list_of_players.each {|x| x.lives = 3}
  @list_of_players.cycle {|x|
    randnum, randnum2 = 1+rand(UPPER_LIMIT), 1+rand(UPPER_LIMIT)
    sign = 1+rand(3)
    rand_math = "+" if sign==1; rand_math = "-" if sign==2; rand_math = "*" if sign==3

    puts "#{x.name}, What does #{randnum} #{rand_math} #{randnum2} = ?"
    guess = (gets.chomp).to_i
    if sign == 1
      if guess == randnum + randnum2
        x.gain_point
      else
        x.lose_life
      end
    elsif sign == 2
      if guess == randnum - randnum2
        x.gain_point
      else
        x.lose_life
      end
    else
      if guess == randnum * randnum2
        x.gain_point
      else
        x.lose_life
      end
    end 

    if x.lives == 0
      puts "#{x.name}, you have lost, Play again?"
      answer = gets.chomp
      if answer == "Yes"
        game_start
      else
        break
      end
    end
  }
end

getting_names
game_start
