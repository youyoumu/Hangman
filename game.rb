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
      until check_incorrect_letter_dupe(@player.the_letter)
        puts "That letter has been marked to be incorrect. Try Again!"
        @player.take_turn
      end
      @computer.update_hint(@player.the_letter)
      show_hint
      puts "#{@computer.counter} turns left!"
    end
  end

  def check_incorrect_letter_dupe(the_letter)
    return false if @computer.incorrect_letter.include?(the_letter)
    return true
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
