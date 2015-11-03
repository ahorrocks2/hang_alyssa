class ChangeTextToAnswer < ActiveRecord::Migration
  def change
    remove_column :games, :text, :string
    add_column :games, :answer, :string
  end
end
