#creating user class
class User
  attr_accessor :username, :log

  def initialize(username)
    @username = username
    @log = []
  end
end
