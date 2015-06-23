class ChangeDefaultOnUsers < ActiveRecord::Migration
  def change
  	change_column :users, :count, :integer, :default => 0
  end
end
