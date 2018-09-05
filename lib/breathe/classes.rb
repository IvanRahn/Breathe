#creating User class
class User
  attr_accessor :username, :log

  def initialize(username)
    #runs a name_check on the username
    @username = name_check(username)
    #we tried array first but decided to go with hash to be able to save dates
    @log = {}
  end

  #Method to check for valid input for the username
  def name_check(name)
    if name.nil? or name.empty? or name =~ /\W+/ or name == "0"
      puts "Everyone must have a valid name."
      #raise an error in case of invalid input
      raise ArgumentError.new("Error - invalid name")
    end
    #capitalize the first letter of the name
    name.capitalize!
    #catch the error and recurse the method until we get correct input
    #TODO move rescue to initial prompt
  rescue
    @name = name_check(gets.chomp)
  end
end

#Class for methods to write/retrieve data

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
