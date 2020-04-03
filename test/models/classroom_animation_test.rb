# == Schema Information
#
# Table name: classroom_animations
#
#  id                :uuid             not null, primary key
#  childrens_maximum :integer          default("0")
#  comment           :text
#  live_url          :string
#  opened            :boolean          default("false")
#  starts_at         :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  classroom_id      :uuid             not null
#  user_id           :uuid             not null
#
# Indexes
#
#  index_classroom_animations_on_classroom_id  (classroom_id)
#  index_classroom_animations_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class ClassroomAnimationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
