class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :letter
      t.integer :game_id

      t.timestamps
    end
  end
end
