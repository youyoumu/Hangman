class Computer
  attr_accessor :the_word, :counter, :hint

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
  end

  def show_hint
    puts @hint.join(" ")
  end

  def update_hint(the_word)
    count
    @hint.each_with_index do |hint, hint_index|
      @hint[hint_index] = the_word if @the_word[hint_index] == the_word
    end
  end

  def count
    @counter -= 1
  end

end
