# == Schema Information
#
# Table name: hip_hop_songs
#
#  id          :integer          not null, primary key
#  title       :string
#  artist      :string
#  path        :string
#  votes       :integer
#  musician_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class HipHopSong < ActiveRecord::Base
	belongs_to :musician

	def zero
		self.update(votes: 0)
	end
	def increment
		self.votes+=1
		t=self.votes
		self.update(votes: t)

	end
end
