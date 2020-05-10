class ClassroomAnimationPolicy < ApplicationPolicy
  def index?
    user.teacher? || user.admin?
  end

  def show?
    user.teacher? || user.admin?
  end

  def create?
    user.teacher? || user.admin?
  end

  def update?
    (user.teacher? && record.user_id == user.id) || user.admin?
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
end
