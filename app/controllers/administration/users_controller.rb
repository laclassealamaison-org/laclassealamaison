class Administration::UsersController < ApplicationController
  def index
    @users = User.simple_users.order(created_at: :desc)
    authorize [:administration, :user], :index?
  end

  def impersonate
    return unless Rails.env.development?
    user = User.find(params[:user_id])
    impersonate_user(user)
    redirect_to helpers.home_path_for(user)
  end
end
