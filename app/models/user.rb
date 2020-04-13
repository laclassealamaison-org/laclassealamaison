# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default("0"), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  sign_in_count          :integer          default("0"), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  enum role: [:user, :responsible_parent, :teacher, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :classroom_animations
  has_many :courses
  has_many :children, foreign_key: :parent_id, inverse_of: :parent
  has_many :classroom_animation_reservations, through: :children

  scope :responsible_parents, -> { where(role: :responsible_parent) }
  scope :teachers, -> { where(role: :teacher) }
  scope :simple_users, -> { where(role: :user) }

  def set_default_role
    self.role ||= :responsible_parent
  end

  def full_name
    [first_name, last_name].join(' ').presence || email
  end

  def full_name_with_email
    full_name + "(#{email})"
  end

  def reservations_for(classroom_animation)
    classroom_animation.classroom_animation_reservations.where(child: children)
  end

  def children_for(classroom_animation)
    children.where(id: classroom_animation.classroom_animation_reservations.select(:child_id))
  end

  def available_children_for(classroom_animation)
    children.where.not(id: children_for(classroom_animation))
  end

end
