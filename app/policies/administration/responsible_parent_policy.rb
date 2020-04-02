class Administration::ResponsibleParentPolicy < ApplicationPolicy
  attr_reader :user, :responsible_parent

  def initialize(user, responsible_parent)
    @user = user
    @responsible_parent = responsible_parent
  end

  def index?
    @user&.admin?
  end
end
