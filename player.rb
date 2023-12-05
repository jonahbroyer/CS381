require_relative "element"
require_relative "history"

### abstract superclass ###
class Player
  attr_reader :name, :history
  def initialize(name, history)
    @name = name
    @history = history
  end

  def play()
    fail "This method should be overridden"
  end
end

### subclasses ###

class StupidBot < Player
  def play()
    @history.log_play($moves[0])
    return $moves[0]
  end
end

class RandomBot < Player
  def play()
    @rand = $moves.sample
    @history.log_play(@rand)
    return @rand
  end
end

class IterativeBot < Player
  def play()
    # @counter = 0
    # if @counter > 5
    #   @counter = 0
    # end
    @move = $moves[@history.plays.length() % 5]
    @history.log_play(@move)
    # @counter += 1
    return @move
  end
end

class LastPlayBot < Player
  def play()
    if @history.opponent_plays.length == 0
      @history.log_play($moves[0])
      return $moves[0]
    else
      @history.log_play(@history.opponent_plays[-1])
      return @history.opponent_plays[-1]
    end
  end
end

class Human < Player
  def play()
    @choices = [1, 2, 3, 4, 5]
    puts "(1) Rock"
    puts "(2) Paper"
    puts "(3) Scissors"
    puts "(4) Lizard"
    puts "(5) Spock"
    print "Enter your move: "
    @input = gets.chomp.to_i
    while @input.negative?() || not((1..5) === @input)
      puts "Invalid move - try again"
      puts "(1) Rock"
      puts "(2) Paper"
      puts "(3) Scissors"
      puts "(4) Lizard"
      puts "(5) Spock"
      print "Enter your move: "
      @input = gets.chomp.to_i
    end
    @history.log_play(@input)
    return $moves[@input - 1]
  end
end

### testing ###
# p1 = StupidBot.new('StupidBot', History.new)
# p2 = RandomBot.new('RandomBot', History.new)
# p3 = IterativeBot.new('IterativeBot', History.new)
# p4 = LastPlayBot.new('LastPlayBot', History.new)
# p5 = Human.new('Human', History.new)
# p1move = p1.play()
# p2move = p2.play()
# p3move = p3.play()
# p4move = p4.play()
# p5move = p5.play()
# puts p1move.compare_to(p2move)
