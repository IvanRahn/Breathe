require_relative "breathe/methods"
require_relative "breathe/classes"

greeting

name = gets.chomp.downcase
smoker = retrieve_data(name)

puts smoker.log
menu(smoker)

save_to_file(smoker)
