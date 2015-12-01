class AddScoreDefault < ActiveRecord::Migration
  def change
    remove_column :games, :score, :integer
  end

  def change
    add_column :games, :hearts, :integer, :default => 5
  end
end
