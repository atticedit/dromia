class Palindrome < ActiveRecord::Base
  validates_presence_of :body

  def format_body
    body = self.body
    body << " (original)" if self.original
    body
  end
end
