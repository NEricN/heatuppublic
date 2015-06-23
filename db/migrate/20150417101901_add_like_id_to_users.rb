class AddLikeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :like_id, :integer
  end
end
