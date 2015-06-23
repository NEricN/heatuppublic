class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.float :score
      t.string :genre
      t.boolean :is_downloadable

      t.timestamps null: false
    end
  end
end
