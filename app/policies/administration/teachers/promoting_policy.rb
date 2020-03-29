class Administration::Teachers::PromotingPolicy < ApplicationPolicy
  attr_reader :user, :teacher

  def initialize(user, teacher)
    @user = user
    @teacher = teacher
  end

  def create?
    @user&.admin?
  end
end
