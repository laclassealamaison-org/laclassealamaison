# == Schema Information
#
# Table name: resources
#
#  id           :uuid             not null, primary key
#  description  :string
#  name         :string
#  url          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :uuid             not null
#
# Indexes
#
#  index_resources_on_classroom_id  (classroom_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#
require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
