class Administration::MenuPolicy < ApplicationPolicy
  attr_reader :user, :menu

  def initialise(user, menu)
    @user = user
    @menu = menu
  end

  def index?
    @user&.admin?
  end
end