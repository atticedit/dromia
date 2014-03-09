class Palindrome < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :user

  belongs_to :user

  def format_body
    originality = self.original ? " | original" : ""
    attribution = " | submitted by: #{self.user.username}"
    body = self.body + originality + attribution
  end
end
