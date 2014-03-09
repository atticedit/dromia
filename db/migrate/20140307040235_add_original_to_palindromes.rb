class AddOriginalToPalindromes < ActiveRecord::Migration
  def change
    add_column :palindromes, :original, :boolean
  end
end
