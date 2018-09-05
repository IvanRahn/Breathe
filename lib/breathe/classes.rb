#creating user class
class User
  attr_accessor :username, :log

  def initialize(username)
    @username = name_check(username)
    #we tried array first but decided to go with hash to have dates
    @log = {}
  end

  def name_check(name)
    if name == nil or name.size == 0 or name =~ /\W+/ or name == "0"
      puts "Everyone must have a valid name."
      raise ArgumentError.new("Error - invalid name")
    end
    name.capitalize!
  rescue
    @name = name_check(gets.chomp)
  end
end

#TODO put in a separate class
class File_operations
  attr_accessor :username

  def initialize(username)
    @username = username
  end

  def retrieve_data
    File.file?("#{@username}") ? customer = read_from_file : customer = User.new(username)
    customer
  end

  def save_to_file
    File.open("#{@username.username}", "w") { |file|
      file.write Oj::dump username
    }
  end

  def read_from_file
    Oj::load File.read("#{@username}")
  end
end
