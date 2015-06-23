class AddMusicianToUser < ActiveRecord::Migration
  def change
    add_column :users, :musician, :boolean
  end
end
