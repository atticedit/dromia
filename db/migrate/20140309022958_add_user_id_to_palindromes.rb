class AddUserIdToPalindromes < ActiveRecord::Migration
  def change
    add_column :palindromes, :user_id, :integer
  end
end
