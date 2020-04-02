class ClassroomAnimationPolicy < ApplicationPolicy
  attr_reader :user, :classroom_animation

  def initialize(user, classroom_animation)
    @user = user
    @classroom_animation = classroom_animation
  end

  def index?
    @user&.teacher? || @user&.admin?
  end

  def show?
    @user&.teacher? || @user&.admin?
  end

  def new?
    @user&.teacher? || @user&.admin?
  end

  def create?
    @user&.teacher? || @user&.admin?
  end

  def edit?
    (@user&.teacher? && @classroom_animation.user_id == @user.id) || @user&.admin?
  end

  def update?
    (@user&.teacher? && @classroom_animation.user_id == @user.id) || @user&.admin?
  end

  def destroy?
    (@user&.teacher? && @classroom_animation.user_id == @user.id) || @user&.admin?
  end
end
