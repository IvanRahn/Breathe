#creating user class
class User
  attr_accessor :username, :log

  def initialize(username)
    @username = first(username)
    #we tried array first but decided to go with hash to have dates
    @log = {}
  end

  def first(first)
    if first == nil or first.size == 0 or first =~ /\W+/
      raise ArgumentError.new("Everyone must have a valid name.")
    end
    first[0] = first[0].chr.capitalize
    @first = first
  end
end
