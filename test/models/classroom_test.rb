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
require 'test_helper'

class ClassroomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
