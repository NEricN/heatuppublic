class AddLikeIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :like_id, :integer
  end
end
