class AddSongLargeToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :song_large, :string
  end
end
