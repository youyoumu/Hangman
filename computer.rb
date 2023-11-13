class Computer
  attr_accessor :the_word, :counter, :hint, :incorrect_letter

  def initialize
    data = File.read("./google-10000-english-no-swears.txt").split("\n")
    @the_word = data.sample
    until @the_word.length >= 5 && @the_word.length <= 12
      @the_word = data.sample
    end
    @hint = []
    @the_word.length.times do
      @hint.push("_")
    end
    @counter = 6
    @incorrect_letter = []
  end

  def show_hint
    puts @hint.join(" ")
    puts "Incorrect letter: #{@incorrect_letter}"
  end

  def update_hint(the_word)
    is_incorrect = true
    @hint.each_with_index do |hint, hint_index|
      if @the_word[hint_index] == the_word
        @hint[hint_index] = the_word
        is_incorrect = false
      end
    end
    @incorrect_letter.push(the_word) if is_incorrect
    count if is_incorrect
  end

  def count
    @counter -= 1
  end

end
