class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :string
      t.integer :word_id

      t.timestamps
    end
  end
end
