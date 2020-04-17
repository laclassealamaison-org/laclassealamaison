class ChildPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.admin? || record.parent_id == user.id
  end

  def new?
    true
  end

  def create?
    true
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
