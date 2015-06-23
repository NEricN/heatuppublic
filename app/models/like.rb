class Like < ActiveRecord::Base
	belongs_to :song
	belongs_to :user
	acts_as_list scope: :user
end
