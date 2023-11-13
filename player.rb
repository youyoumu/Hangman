class Player
  attr_accessor :the_letter

  def take_turn
    guess
    check_guess
    normalize_letter
  end

  private

  def guess
    print "Pick a letter: "
    @the_letter = gets.chomp
  end

  def check_guess
    until @the_letter =~ /[[:alpha:]]/ && @the_letter.length == 1
      puts "Input Invalid! Try again."
      guess
    end
  end

  def normalize_letter
    @the_letter.downcase!
  end
end
