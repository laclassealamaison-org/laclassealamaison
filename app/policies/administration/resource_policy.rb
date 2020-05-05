class Administration::ResourcePolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def new?
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
