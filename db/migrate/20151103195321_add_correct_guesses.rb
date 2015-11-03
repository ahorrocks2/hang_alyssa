class AddCorrectGuesses < ActiveRecord::Migration
  def change
    add_column :guesses, :in_answer?, :boolean, :default => false
  end
end
