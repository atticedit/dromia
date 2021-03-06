class Palindrome < ActiveRecord::Base
  validates_presence_of :body, message: "can't be blank."
  validates_presence_of :user
  validates :body, uniqueness: { case_sensitive: false, message: "already exists on Dromia." }
  validates :body, palindromicness: true # <-- custom palindromicness validator

  belongs_to :user
  # favorites feature is a work in progress
  has_many :favorites
  has_many :users, through: :favorites

  def format_attribution
    originality = self.original ? "an original " : ""
    attribution = "submitted by: #{self.user.username}"
    originality + attribution
  end
end
