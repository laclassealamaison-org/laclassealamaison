class ClassroomAnimationReservationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.child.parent_id == user.id || user.admin?
  end

  def new?
    user.responsible_parent? || user.admin?
  end

  def create?
    new?
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
        scope.where(child: user.children)
      end
    end
  end
end
