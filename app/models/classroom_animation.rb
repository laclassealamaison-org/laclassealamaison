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
#  course_id         :uuid
#  user_id           :uuid             not null
#
# Indexes
#
#  index_classroom_animations_on_classroom_id  (classroom_id)
#  index_classroom_animations_on_course_id     (course_id)
#  index_classroom_animations_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#  fk_rails_...  (user_id => users.id)
#
class ClassroomAnimation < ApplicationRecord
  belongs_to :classroom
  belongs_to :course, optional: true
  belongs_to :user

  scope :live, -> { where("starts_at < current_timestamp AND starts_at + interval '1 hour' > current_timestamp") }
  scope :open, -> { where(opened: true) }
  scope :pasted, -> { where('starts_at < current_timestamp') }
  scope :upcoming, -> { where('starts_at > current_timestamp') }

  validates_uniqueness_of :starts_at, scope: :classroom_id

  def to_s
    if course.present?
      "#{course.title}, #{human_time}"
    else
      "#{classroom.name}, #{human_time}"
    end
  end

  def start_time # Used implicitly by week_calendar, don't remove
    self.starts_at
  end

  def human_time
    if starts_at < Time.now + 7.days
      I18n.l(starts_at, format: "%A à %H:%M")
    else
      I18n.l(starts_at, format: "%A %d %B à %H:%M")
    end
  end
end
