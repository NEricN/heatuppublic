# == Schema Information
#
# Table name: rock_songs
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

class RockSong < ActiveRecord::Base
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
