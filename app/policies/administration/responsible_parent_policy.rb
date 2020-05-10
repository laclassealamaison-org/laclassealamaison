class Administration::ResponsibleParentPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def update?
    user.admin?
  end

  class Scope < Scope
    def resolve
      User.responsible_parents
    end
  end
end
