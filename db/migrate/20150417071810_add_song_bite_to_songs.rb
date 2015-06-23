class AddSongBiteToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :song_bite, :string
  end
end