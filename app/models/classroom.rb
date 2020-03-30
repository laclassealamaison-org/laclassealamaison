# == Schema Information
#
# Table name: classrooms
#
#  id         :uuid             not null, primary key
#  color      :string
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Classroom < ApplicationRecord
  has_many :resources
  has_many :classroom_animations
end
