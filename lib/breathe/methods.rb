require_relative "classes"
require "date"
require "json"
require "Oj"

#greeting method and personalisation
def greeting
  puts "Hey awesome to see you! What's your name?"
end

#TODO:create class for smokers that inherits from user

#Method to prompt questions for smoking behaviour

def smoking(user)
  puts "#{user.username}, have you smoked today? Y/N"
  #Control flow using switch statement to make it more dry and easier to scale
  case gets.chomp
  when "y"
    cig_amount(user)
  when "n"
    success(user)
  else
    #raise an error in case of incorrect input (could've used regular if/else,
    #but due to assignment requirements we need to use exceptions somewhere)
    raise ArgumentError.new("Only Y or N")
  end
  #rescue from the error: recurse the function
rescue
  begin
    puts "Something is wrong with your input"
    smoking(user)
  end
end

#Method to prompt for number of cigarettes smoked, log it and write a message to the user
def cig_amount(user)
  puts "How many cigarettes have you smoked today?"
  cigarette_amount = gets.chomp

  #raise an error in case of incorrect input
  if cigarette_amount =~ /\D+/
    raise ArgumentError.new("Seems like you're giving us some incorrect input")
  end
  user.log[Date.today.iso8601] = cigarette_amount
  user.sum
  puts "You f***d up, #{user.username}!"
  #rescue from the error: recurse the function
rescue
  cig_amount(user)
end

#Method to return encouraging message to the user in case of success and log their smoking behaviour
def success(user)
  puts "Well done! Keep up the amazing work #{user.username}!"
  user.log[Date.today.iso8601] = 0
end
