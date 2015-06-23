# == Schema Information
#
# Table name: musicians
#
#  id         :integer          not null, primary key
#  artist     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Musician < ActiveRecord::Base
end
