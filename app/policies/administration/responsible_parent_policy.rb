class Administration::ResponsibleParentPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      User.responsible_parent
    end
  end
end
