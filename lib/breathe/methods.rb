require_relative "classes"
require "date"
require "json"
require "Oj"

#greeting method and personalisation
def greeting
  system "clear"
  puts "Hey awesome to see you! What's your name?"
end

#TODO:create class for smokers that inherits from user

#Method to prompt questions for smoking behaviour

def smoking(user)
  puts "#{user.username}, have you smoked today? Y/N"
  #Control flow using switch statement to make it more dry and easier to scale
  case gets.chomp
  when "y"
    user.cig_amount
  when "n"
    user.success
  else
    #raise an error in case of incorrect input
    raise ArgumentError.new("Only Y or N")
  end
  #rescue from the error: recurse the function
rescue
  begin
    system "clear"
    puts "Seems like you did not reply with Y or N, please try again."
    sleep(0.5)
    smoking(user)
  end
end

# Method to prompt for number of cigarettes smoked, log it and write a message to the user

#Method to return encouraging message to the user in case of success and log their smoking behaviour
