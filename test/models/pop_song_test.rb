# == Schema Information
#
# Table name: pop_songs
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

class PopSongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
