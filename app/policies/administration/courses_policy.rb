class Administration::CoursesPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def create?
    user.admin?
  end
end
