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
class Child < ApplicationRecord
  belongs_to :parent, class_name: "User", inverse_of: :children
  belongs_to :classroom
  has_many :classroom_animation_reservations

  def next_animation
    classroom_animation_reservations.first&.classroom_animation
  end
end
