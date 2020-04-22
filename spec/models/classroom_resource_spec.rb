# == Schema Information
#
# Table name: classroom_resources
#
#  id           :uuid             not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :uuid             not null
#  resource_id  :uuid             not null
#
# Indexes
#
#  index_classroom_resources_on_classroom_id  (classroom_id)
#  index_classroom_resources_on_resource_id   (resource_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#  fk_rails_...  (resource_id => resources.id)
#
require 'rails_helper'

RSpec.describe ClassroomResource, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
