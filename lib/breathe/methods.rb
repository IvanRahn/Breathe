require_relative "classes"

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
    smoker_name.log << 1
  else
    puts "Well done! Keep up the amazing work #{smoker_name.username}!"
    smoker_name.log << 0
  end
end

# Did you smoke in the last 24 hours?
#   How many cigarettes did you smoke in the last 24 hours? (give range)

# if no...Did you have any cravings to smoke today?
#   ....How would you rate your mood today.(give range)
