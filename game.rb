require "./player.rb"
require "./computer.rb"
require 'json'

class Game

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def play
    show_hint
    puts "#{@computer.counter} turns left!"
    until check_winner || @player.want_to_save
      @player.take_turn
      break if @player.want_to_save
      until check_incorrect_letter_dupe(@player.the_letter) || @player.want_to_save
        puts "That letter has been marked to be incorrect. Try Again!"
        @player.take_turn
      end
      @computer.update_hint(@player.the_letter)
      show_hint
      puts "#{@computer.counter} turns left!"
    end
    save_game if @player.want_to_save
  end

  def save_game
    data = {
      hint: @computer.hint,
      the_word: @computer.the_word,
      counter: @computer.counter,
      incorrect_letter: @computer.incorrect_letter
    }
    File.write('save_data.json', data.to_json)
    puts "Data has been saved!"
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

  def load
    data = File.read('save_data.json')
    data = JSON.parse(data)
    @computer.hint = data["hint"]
    @computer.the_word = data["the_word"]
    @computer.counter = data["counter"]
    @computer.incorrect_letter = data["incorrect_letter"]
  end
end
