require "./player.rb"
require "./computer.rb"

class Game

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def play
    show_hint
    puts @computer.the_word
    until check_winner
      @player.take_turn
      @computer.update_hint(@player.the_letter)
      show_hint
      puts "#{@computer.counter} turns left!"
    end
  end

  def check_winner
    if !@computer.hint.include?("_")
      puts "Player Wins!"
      return true
    end
    if @computer.counter == 0
      puts "Computer Wins!"
      return true
    end
    return false
  end

  def show_hint
    @computer.show_hint
  end
end
