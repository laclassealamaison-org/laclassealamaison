# == Schema Information
#
# Table name: children
#
#  id           :uuid             not null, primary key
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :uuid             not null
#  parent_id    :uuid             not null
#
# Indexes
#
#  index_children_on_classroom_id  (classroom_id)
#  index_children_on_parent_id     (parent_id)
#
require 'rails_helper'

RSpec.describe Child, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
