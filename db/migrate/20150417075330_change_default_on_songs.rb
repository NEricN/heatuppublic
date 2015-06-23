class ChangeDefaultOnSongs < ActiveRecord::Migration
  def change
  	change_column :songs, :score, :float, :default => 400
  end
end
