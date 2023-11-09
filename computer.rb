class Computer
  attr_accessor :the_word

  def initialize
    data = File.read("./google-10000-english-no-swears.txt").split("\n")
    @the_word = data.sample
    until @the_word.length >= 5 && @the_word.length <= 12
      @the_word = data.sample
    end
  end

end

computer = Computer.new
p computer.the_word
