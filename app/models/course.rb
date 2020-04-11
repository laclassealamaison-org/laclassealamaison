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
  has_many :classroom_animations
end
