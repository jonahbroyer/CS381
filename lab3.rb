require_relative "element"
require_relative "player"
require_relative "history"

#########################################
#     CS 381 - Programming Lab #3		#
#										#
#  Jonah Broyer					 	    #
#  broyerj@oregonstate.edu	            #
#										#
#########################################

# function to print a welcome message
def welcome
	puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  puts "\nPlease choose two players:"
  puts "(1) StupidBot"
  puts "(2) RandomBot"
  puts "(3) IterativeBot"
  puts "(4) LastPlayBot"
  puts "(5) Human"
	print "Select player 1:"
	$player1 = gets.chomp.to_i
	print "Select player 2:"
	$player2 = gets.chomp.to_i
	while $player1.negative?() || $player2.negative?() || not((1..5) === $player1) || not((1..5) === $player2)
		puts "Invalid choice(s) - start over"
		print "Select player 1:"
		$player1 = gets.chomp.to_i
		print "Select player 2:"
		$player2 = gets.chomp.to_i
	end
	$player1 = get_choices($player1, $player1_history)
	$player2 = get_choices($player2, $player2_history)
	#@history = History.new()
	#$player1 = IterativeBot.new('LastPlayBot', @history)
	#$player2 = IterativeBot.new('LastPlayBot', @history)
	puts "#{$player1.name} vs. #{$player2.name}"
end

def get_choices(player_input, player_history)
	@choices = {1=>StupidBot.new('StupidBot', player_history), 2=>RandomBot.new('RandomBot', player_history),
		 					3=>IterativeBot.new('IterativeBot', player_history), 4=>LastPlayBot.new('LastPlayBot', player_history),
							5=>Human.new('Human', player_history)}
	return @choices[player_input]
end

# function to create a bot
# def create_player(player)
# 	case player
# 	when 1
# 		bot = StupidBot.new('StupidBot', History.new)
# 	when 2
# 		bot = RandomBot.new('RandomBot', History.new)
# 	when 3
# 		bot = IterativeBot.new('IterativeBot', History.new)
# 	when 4
# 		bot = LastPlayBot.new('LastPlayBot', History.new)
# 	when 5
# 		bot = Human.new('Human', History.new)
# 	end
# end

# output bot comparisons
def round(rounds)
	for i in 1..rounds
		puts "\nRound #{i}:"
		p1 = $player1.play()
		p2 = $player2.play()
		puts "Player 1 chose #{p1.name}"
		puts "Player 2 chose #{p2.name}"
		p1move = p1.compare_to(p2)
		puts p1move[0]
		$player1_history.log_opponent_play(p2)
		$player2_history.log_opponent_play(p1)

		if p1move[1] == "Win"
			$player1_history.score += 1
			puts "Player 1 won the round"
		elsif p1move[1] == "Lose"
			$player2_history.score += 1
			puts "Player 2 won the round"
		elsif p1move[1] == "Tie"
			puts "Round was a tie"
		end
	end

	puts "\nFinal score is #{$player1_history.score} to #{$player2_history.score}"

	if $player1_history.score > $player2_history.score
		puts "Player 1 wins"
	elsif $player1_history.score < $player2_history.score
		puts "Player 2 wins"
	else
		puts "Game was a draw"
	end
end

def game(rounds)
	$player1_history = History.new()
	$player2_history = History.new()
	# welcome message
	welcome
	# play the game
	round(rounds)
end


# Main Program (should be last)
n_rounds = 5
# call to kick off the game
game(n_rounds)
