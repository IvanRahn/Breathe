require_relative "../lib/breathe/classes"
# require_relative "spec_helper"
describe "breathe" do
  it "should have class User" do
    user = User.new("name")
    expect(user).to be_an_instance_of(User)
  end
  it "should not accept empty name" do
    expect { User.new("") }.to raise_error(ArgumentError)
  end
end
