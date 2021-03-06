require_relative "classes"
require "date"
require "json"
require "Oj"
#creating User class
class User
  attr_accessor :username, :log

  def initialize(username)
    #runs a name_check on the username
    @username = name_check(username)
    @log = {}
  end

  #Method to check for valid input for the username
  def name_check(name)
    if name.nil? or name.empty? or name =~ /\W+/ or name == "0"

      #raise an error in case of invalid input
      raise ArgumentError.new("Error - invalid name")
    end
    #capitalize the first letter of the name
    name = name.capitalize
  end

  # method to puts the average amount
  def average
    average = @log.values.inject { |sum, el| sum + el }.to_f / log.values.size
    puts @log.values.last < average ? "Today you had less than your average amount! Keep up the good work!" : "You smoked more than average today, stressful day?"
  end

  #Method to return encouraging message to the user in case of success and log their smoking behaviour
  def success
    @log[Date.today.iso8601] = 0

    puts "Well done, #{@username}! You haven't smoked for #{@log.count { |value| value = 0 }} days! "
  end

  # Method to prompt for number of cigarettes smoked, log it and write a message to the user
  def cig_amount
    puts "How many cigarettes have you smoked today?"
    cigarette_amount = gets.chomp
    #raise an error in case of incorrect input
    if cigarette_amount =~ /\D+/ or cigarette_amount.start_with?("0")
      raise ArgumentError.new("Error - incorrect input")
    end
    @log[Date.today.iso8601] = cigarette_amount.to_i
    average
    puts "Never give up giving up!"
    #rescue from the error: recurse the function
  rescue
    system "clear"
    puts "Seems like did not reply with a number, please try again"
    sleep(0.5)
    cig_amount
  end

  def smoking
    puts "#{username}, have you smoked today? Y/N"
    #Control flow using switch statement to make it more dry and easier to scale
    case gets.chomp
    when "y"
      cig_amount
    when "n"
      success
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
      smoking
    end
  end
end

class FileOperations
  attr_accessor :username

  def initialize(username)
    @username = username
  end

  # Method to check if file exists, returns new instance of User class if it doesn't
  # and retrieves the data from the file if the user already exists
  def retrieve_data
    File.file?("#{@username}") ? customer = read_from_file : customer = User.new(username)
    customer
  end

  # Saves user object to file using Oj gem. We chose Oj over Nick's gists to skip the hashing process
  def save_to_file
    File.open("#{@username.username}", "w") { |file|
      file.write Oj::dump username
    }
  end

  # Reads from file
  def read_from_file
    Oj::load File.read("#{@username}")
  end
end
