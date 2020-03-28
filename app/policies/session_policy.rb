class SessionPolicy < ApplicationPolicy
  attr_reader :user, :session

  def initialize(user, session)
    @user = user
    @session = session
  end

  def new?
    @user&.teacher?
  end

  def create?
    @user&.teacher?
  end
end
