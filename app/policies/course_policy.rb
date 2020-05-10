class CoursePolicy < ApplicationPolicy
  def index?
    user.admin? || user.teacher?
  end

  def show?
    user.admin? || record.user_id == user.id
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def destroy?
    show?
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
