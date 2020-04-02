class Administration::ResponsibleParents::PromotingPolicy < ApplicationPolicy
  attr_reader :user, :responsible_parent

  def initialize(user, responsible_parent)
    @user = user
    @responsible_parent = responsible_parent
  end

  def create?
    @user&.admin?
  end
end
