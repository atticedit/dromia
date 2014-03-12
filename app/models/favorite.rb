class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :palindrome
end
