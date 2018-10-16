require_relative "breathe/methods"
require_relative "breathe/classes"
require "io/console"
# Display greeting
greeting

begin
  # Create new user or retrieve existing user data
  customer = FileOperations.new(gets.chomp).retrieve_data

  # Run the method to prompt questions for smoking behaviour
  smoking(customer)

  # Save data to file
  FileOperations.new(customer).save_to_file

  # rescue the exception and run the program again until we get correct input
rescue Exception => exception
  system "clear"
  puts "Seems like something went wrong, please type your name again"
  retry
end
