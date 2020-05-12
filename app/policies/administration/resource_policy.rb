class Administration::ResourcePolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  def update?
    user.admin?
  end

  def create?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      Resource.all
    end
  end
end
