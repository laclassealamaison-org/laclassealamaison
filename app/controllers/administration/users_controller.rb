class Administration::UsersController < ApplicationController
  def index
    @users = User.simple_users.order(created_at: :desc)
    authorize [:administration, :user], :index?
  end
end
