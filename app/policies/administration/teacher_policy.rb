class Administration::TeacherPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def update?
    user.admin?
  end

  class Scope < Scope
    def resolve
      User.teacher
    end
  end
end
