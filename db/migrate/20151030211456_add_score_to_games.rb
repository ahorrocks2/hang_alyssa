class AddScoreToGames < ActiveRecord::Migration
  def change
    remove_column :games, :string, :integer
    add_column :games, :score, :integer
    remove_column :games, :round_id, :integer
  end
end
