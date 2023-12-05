### superclass ###
class Element
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def compare_to(other_name)
    fail "This method should be overridden"
  end
end

### subclasses ###

=begin
  Rock crushes Lizard
  Rock crushes Scissors
=end
class Rock < Element
  def compare_to(other_name)
    @name = "Rock"
    case other_name.name
    when @name then
      return "Rock equals Rock", "Tie"
    when "Paper" then
      return "Paper covers Rock", "Lose"
    when "Scissors" then
      return "Rock crushes Scissors", "Win"
    when "Lizard" then
      return "Rock crushes Lizard", "Win"
    when "Spock" then
      return "Spock vaporizes Rock", "Lose"
    else
      return "Unknown outcome"
    end
  end
end

=begin
  Paper covers Rock
  Paper disproves Spock
=end
class Paper < Element
  def compare_to(other_name)
    @name = "Paper"
    case other_name.name
    when "Rock" then
      return "Paper covers Rock", "Win"
    when @name then
      return "Paper equals Paper", "Tie"
    when "Scissors" then
      return "Scissors cut Paper", "Lose"
    when "Lizard" then
      return "Lizard eats Paper", "Lose"
    when "Spock" then
      return "Paper disproves Spock", "Win"
    else
      return "Unknown outcome"
    end
  end
end

=begin
  Scissors cut Paper
  Scissors decapitate Lizard
=end
class Scissors < Element
  def compare_to(other_name)
    @name = "Scissors"
    case other_name.name
    when "Rock" then
      return "Rock crushes Scissors", "Lose"
    when "Paper" then
      return "Scissors cut Paper", "Win"
    when @name then
      return "Scissors equals Scissors", "Tie"
    when "Lizard" then
      return "Scissors decapitate Lizard", "Win"
    when "Spock" then
      return "Spock smashes Scissors", "Lose"
    else
      return "Unknown outcome"
    end
  end
end

=begin
  Lizard poisons Spock
  Lizard eats Paper
=end
class Lizard < Element
  def compare_to(other_name)
    @name = "Lizard"
    case other_name.name
    when "Rock" then
      return "Rock crushes Lizard", "Lose"
    when "Paper" then
      return "Lizard eats Paper", "Win"
    when "Scissors" then
      return "Scissors decapitate Lizard", "Lose"
    when @name then
      return "Lizard equals Lizard", "Tie"
    when "Spock" then
      return "Lizard poisons Spock", "Win"
    else
      return "Unknown outcome"
    end
  end
end

=begin
  Spock smashes Scissors
  Spock vaporizes Rock
=end
class Spock < Element
  def compare_to(other_name)
    @name = "Spock"
    case other_name.name
    when "Rock" then
      return "Spock vaporizes Rock", "Win"
    when "Paper" then
      return "Paper disproves Spock", "Lose"
    when "Scissors" then
      return "Spock smashes Scissors", "Win"
    when "Lizard" then
      return "Lizard poisons Spock", "Lose"
    when @name then
      return "Spock equals Spock", "Tie"
    else
      return "Unknown outcome"
    end
  end
end

### testing ###
# rock = Rock.new("Rock")
# paper = Paper.new("Paper")
# return rock.compare_to(paper) # Paper covers rock", "Lose
# return paper.compare_to(rock) # Paper covers rock", "Win
# return rock.compare_to(rock)  # Rock equals rock, Tie

# list of the five Elements objects
$moves = Array.new

$moves[0] = Rock.new("Rock")
$moves[1] = Paper.new("Paper")
$moves[2] = Scissors.new("Scissors")
$moves[3] = Lizard.new("Lizard")
$moves[4] = Spock.new("Spock")
