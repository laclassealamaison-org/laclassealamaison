# == Schema Information
#
# Table name: classroom_animation_reservations
#
#  id                     :uuid             not null, primary key
#  status                 :integer          default("0"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  child_id               :uuid             not null
#  classroom_animation_id :uuid             not null
#
# Indexes
#
#  car_ca_id                                           (classroom_animation_id)
#  index_classroom_animation_reservations_on_child_id  (child_id)
#
class ClassroomAnimationReservation < ApplicationRecord
  belongs_to :child
  belongs_to :classroom_animation
  enum status: {
    subscribed: 0,
    waiting: 1,
    booked: 2,
    canceled: 3
  }
  def title
    classroom_animation.course&.title || classroom_animation.classroom.name
  end
end
