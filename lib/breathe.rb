require_relative "breathe/methods"
require_relative "breathe/classes"

greeting
smoker = User.new(gets.chomp)

menu(smoker)
