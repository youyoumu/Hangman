class Player
  attr_accessor :the_letter, :want_to_save

  def initialize
    @want_to_save = false
  end

  def take_turn
    guess
    check_guess
    normalize_letter
  end

  private

  def guess
    print "Pick a letter: "
    @the_letter = gets.chomp
    saving?
  end

  def saving?
    @want_to_save = true if @the_letter == "save"
  end

  def check_guess
    until @the_letter =~ /[[:alpha:]]/ && @the_letter.length == 1 || @want_to_save
      puts "Input Invalid! Try again."
      guess
    end
  end

  def normalize_letter
    @the_letter.downcase!
  end
end
