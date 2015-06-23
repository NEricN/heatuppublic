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

require 'test_helper'

class HipHopSongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
