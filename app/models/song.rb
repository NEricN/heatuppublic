class Song < ActiveRecord::Base
	belongs_to :user
	has_many :likers, :through => :likes, :source => :user
	has_many :likes
	validates :user_id, presence: true
	validates :genre, presence: true
	mount_uploader :song_bite, SongBiteUploader
	mount_uploader :song_large, SongLargeUploader
end
