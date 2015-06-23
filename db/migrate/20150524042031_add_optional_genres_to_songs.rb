class AddOptionalGenresToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :optional_genre_1, :string
    add_column :songs, :optional_genre_2, :string
  end
end
