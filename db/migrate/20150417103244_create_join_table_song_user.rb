class CreateJoinTableSongUser < ActiveRecord::Migration
  def change
    create_table :songs_users do |t|
      # t.index [:song_id, :user_id]
      # t.index [:user_id, :song_id]
      t.integer :song_id
      t.integer :user_id
      t.integer :liker_id
      t.integer :songs_liked_id
    end
  end
end
