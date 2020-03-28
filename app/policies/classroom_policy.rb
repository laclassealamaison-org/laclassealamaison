class ClassroomPolicy < ApplicationPolicy
  attr_reader :user, :classroom

  def initialize(user, classroom)
    @user = user
    @classroom = classroom
  end

  def index?
    true
  end

  def show?
    true
  end
end
