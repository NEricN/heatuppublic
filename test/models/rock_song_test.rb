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

require 'test_helper'

class RockSongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
