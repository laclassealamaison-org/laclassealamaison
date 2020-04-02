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

  def edit?
    @user&.teacher? && @classroom_animation.user_id == @user.id
  end

  def update?
    @user&.teacher? && @classroom_animation.user_id == @user.id
  end

  def destroy?
    @user&.teacher? && @classroom_animation.user_id == @user.id
  end
end
