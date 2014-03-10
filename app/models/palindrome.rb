class Palindrome < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :user
  validates :body, uniqueness: { case_sensitive: false, message: "already exists on Dromia" }

  belongs_to :user

  def format_body
    originality = self.original ? " | original" : ""
    attribution = " | submitted by: #{self.user.username}"
    body = self.body + originality + attribution
  end
end
