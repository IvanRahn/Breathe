#creating user class
class User
  attr_accessor :username, :log

  def initialize(username)
    @username = username
    #we tried array first but decided to go with hash to have dates
    @log = {}
  end

  def method
    puts "yo"
  end
end
