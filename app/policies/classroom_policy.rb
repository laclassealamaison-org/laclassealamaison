class ClassroomPolicy < ApplicationPolicy
  attr_reader :user, :classroom

  def initialize(user, classroom)
  end

  def index?
    true
  end

  def show?
    true
  end
end
