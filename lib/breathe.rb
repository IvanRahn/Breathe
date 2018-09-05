require_relative "breathe/methods"
require_relative "breathe/classes"

greeting

customer = File_operations.new(gets.chomp).retrieve_data

puts customer.log

smoking(customer)

File_operations.new(customer).save_to_file
