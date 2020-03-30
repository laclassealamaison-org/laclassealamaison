class ClassroomAnimationPolicy < ApplicationPolicy
  attr_reader :user, :classroom_animation

  def initialize(user, classroom_animation)
    @user = user
    @classroom_animation = classroom_animation
  end

  def show?
    @user&.teacher?
  end

  def new?
    @user&.teacher?
  end

  def create?
    @user&.teacher?
  end
end
