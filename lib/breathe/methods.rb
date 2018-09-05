require_relative "classes"
# require_relative "json_to_hash"
require "date"
require "json"
require "Oj"

#greeting method and personalisation
def greeting
  puts "Hey awesome to see you! What's your name?"
end

#create class for smokers that inherits from user
#main menu method
def smoking(user)
  puts "#{user.username}, have you smoked today? Y/N"
  case gets.chomp
  when "y"
    cig_amount(user)
  when "n"
    success(user)
  else
    raise ArgumentError.new("Only Y or N")
  end
rescue
  begin
    puts "Something is wrong with your input"
    smoking(user)
  end
end

def cig_amount(user)
  puts "How many cigarettes have you smoked today?"
  cigarette_amount = gets.chomp
  if cigarette_amount =~ /\D+/
    raise ArgumentError.new("Seems like you're giving us some incorrect input")
  end
  user.log[Date.today.iso8601] = cigarette_amount
  puts "You f***d up, #{user.username}!"
rescue
  cig_amount(user)
end

def success(user)
  puts "Well done! Keep up the amazing work #{user.username}!"
  user.log[Date.today.iso8601] = 0
end

#save object to a file

#read file

# Did you smoke in the last 24 hours?
#   How many cigarettes did you smoke in the last 24 hours? (give range)

# if no...Did you have any cravings to smoke today?
#   ....How would you rate your mood today.(give range)
