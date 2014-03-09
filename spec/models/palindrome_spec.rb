require 'spec_helper'

describe Palindrome do
  context "missing user" do
    it "should not be valid" do
      palindrome = Palindrome.new(body: "Pup")
      # Equivalent to: refute palindrome.valid?
      palindrome.should_not be_valid
    end
  end
  context "with a user" do
    it "should be valid" do
      user = User.create(email: "test@email.com", password: "password", password_confirmation: "password")
      palindrome = Palindrome.new(body: "Did", user: user)
      # Equivalent to: assert palindrome.valid?
      palindrome.should be_valid
    end
  end
end
