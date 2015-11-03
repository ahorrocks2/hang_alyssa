class AddWordToGame < ActiveRecord::Migration
  def change
    add_column :games, :text, :string
  end
end
