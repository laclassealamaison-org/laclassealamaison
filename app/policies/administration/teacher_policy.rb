class Administration::TeacherPolicy < ApplicationPolicy
  attr_reader :user, :teacher

  def initialize(user, teacher)
    @user = user
    @teacher = teacher
  end

  def index?
    @user&.admin?
  end
end
