class UpdateGames < ActiveRecord::Migration
  def change
    remove_column :games, :word_id, :integer
    add_column :games, :round_id, :integer
  end
end
