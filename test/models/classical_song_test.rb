# == Schema Information
#
# Table name: classical_songs
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

class ClassicalSongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
