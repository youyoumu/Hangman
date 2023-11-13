require "./game.rb"

puts "Welcome to Hangman game!"

puts "Do you want to start a New Game or Continue?"
puts "1 = New Game"
puts "2 = Continue"

selection = gets.chomp
until selection == "1" || selection == "2"
  puts "Input invalid!"
  selection = gets.chomp
end

game = Game.new

if selection == "1"
  puts "Type 'save' in the middle of the game to save your data."
  game.play
elsif selection == "2"
  puts "Save data has been loaded!"
  game.load
  game.play
end
