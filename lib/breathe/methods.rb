require_relative "classes"
require_relative "json_to_hash"
require "date"
require "json"
require "Oj"

#greeting method and personalisation
def greeting
  puts "Hey awesome to see you! What's your name?"
end

#main menu method
def menu(smoker_name)
  puts "#{smoker_name.username}, have you smoked today? Y/N"

  if gets.chomp == "Y"
    puts "How many cigarettes have you smoked today?"
    cigarette_amount = gets.chomp.to_i
    smoker_name.log[Date.today.iso8601] = cigarette_amount
    puts "You failed!"
  else
    puts "Well done! Keep up the amazing work #{smoker_name.username}!"
    smoker_name.log[Date.today.iso8601] = 0
  end
end

def existing?(smoker)
  File.file?("#{smoker}")
end

def retrieve_data(smoker)
  existing?(smoker) ? smoker = read_from_file(smoker) : smoker = User.new(smoker)
  smoker
end

#save object to a file
def save_to_file(object)
  File.open("#{object.username}", "w") { |file|
    file.write Oj::dump object
  }
end

#read file
def read_from_file(smoker)
  smoker = Oj::load File.read("#{smoker}")
end

# Did you smoke in the last 24 hours?
#   How many cigarettes did you smoke in the last 24 hours? (give range)

# if no...Did you have any cravings to smoke today?
#   ....How would you rate your mood today.(give range)
