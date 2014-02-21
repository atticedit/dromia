class CreatePalindromes < ActiveRecord::Migration
  def change
    create_table :palindromes do |t|
      t.text :body

      t.timestamps
    end
  end
end
