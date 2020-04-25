# == Schema Information
#
# Table name: classroom_animations
#
#  id                                     :uuid             not null, primary key
#  childrens_maximum                      :integer          default("0")
#  classroom_animation_reservations_count :integer          default("0"), not null
#  comment                                :text
#  live_url                               :string
#  opened                                 :boolean          default("false")
#  starts_at                              :datetime
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#  classroom_id                           :uuid             not null
#  course_id                              :uuid
#  user_id                                :uuid             not null
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
  has_many :classroom_animation_reservations
  has_many :children, through: :classroom_animation_reservations

  scope :live, -> { where("starts_at < current_timestamp AND starts_at + interval '1 hour' > current_timestamp") }
  scope :hot, -> { where("starts_at < current_timestamp + interval '10 minute' AND starts_at + interval '1 hour' > current_timestamp") }
  scope :open, -> { where(opened: true) }
  scope :closed, -> { where(opened: false) }
  scope :pasted, -> { where('starts_at < current_timestamp') }
  scope :upcoming, -> { where('starts_at > current_timestamp') }
  scope :available, -> { where('classroom_animation_reservations_count < childrens_maximum') }

  validates_uniqueness_of :starts_at, scope: :classroom_id

  def to_s
    if course.present?
      course.title
    else
      classroom.name
    end
  end

  def full?
    classroom_animation_reservations_count >= childrens_maximum
  end

  def occupation
    full? ? 'complet' : "#{classroom_animation_reservations_count}/#{childrens_maximum} élèves"
  end

  def start_time # Used implicitly by week_calendar, don't remove
    starts_at
  end

  def human_time
    format = if starts_at.to_date == Date.today
               "Aujourd'hui à %kh"
             elsif starts_at < Time.now + 7.days
               '%A à %kh'
             else
               '%A %d %B à %kh'
    end
    format += '%M' if starts_at.min != 0
    I18n.l(starts_at, format: format)
  end
end
