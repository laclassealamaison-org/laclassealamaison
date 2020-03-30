# == Schema Information
#
# Table name: classroom_animations
#
#  id                :uuid             not null, primary key
#  childrens_maximum :integer          default("0")
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
class ClassroomAnimation < ApplicationRecord
  belongs_to :classroom
  belongs_to :user

  scope :live, -> { where("starts_at < current_timestamp AND starts_at + interval '1 hour' > current_timestamp") }
  scope :upcoming, -> { where("starts_at > current_timestamp") }
  scope :open, -> { where(opened: true) }

  validates_uniqueness_of :starts_at, scope: :classroom_id
end
