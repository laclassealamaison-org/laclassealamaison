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
#  unique_reservation_idx                              (child_id,classroom_animation_id) UNIQUE
#
class ClassroomAnimationReservation < ApplicationRecord
  belongs_to :child
  belongs_to :classroom_animation, counter_cache: true
  enum status: {
    subscribed: 0,
    waiting: 1,
    booked: 2,
    canceled: 3
  }

  scope :former, -> { joins(:classroom_animation).where('classroom_animations.starts_at <= current_timestamp').order(:starts_at) }
  scope :upcoming, -> { joins(:classroom_animation).where('classroom_animations.starts_at > current_timestamp').order(:starts_at) }

  def title
    classroom_animation.course&.title || classroom_animation.classroom.name
  end

  def to_s
    "#{child.name}, #{classroom_animation}"
  end


  def presence_confirmation
    if self.starts_at - DateTime.now <= 1
    end
  end
end
