# == Schema Information
#
# Table name: courses
#
#  id           :uuid             not null, primary key
#  content      :text             not null
#  description  :string           not null
#  published    :boolean          default("false"), not null
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :uuid             not null
#  user_id      :uuid             not null
#
# Indexes
#
#  index_courses_on_classroom_id  (classroom_id)
#  index_courses_on_user_id       (user_id)
#
class Course < ApplicationRecord
  belongs_to :user
  belongs_to :classroom
  has_many :classroom_animations, dependent: :destroy

  before_create :publish

  validates :title, presence: true

  def title_with_description
    s = title
    s += " (#{description})" if description
    s
  end

  def available?
    classroom_animations.upcoming.available.exists?
  end

  def self.available
    where(id: classroom_animation.upcoming.available.select(:course_id))
  end

  def self.ordered_by_level
    joins(:classroom).order("classrooms.position")
  end

  private

  def publish
    self.published = true
  end
end
