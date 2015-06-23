class AddWebsiteToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :website, :string
  end
end
