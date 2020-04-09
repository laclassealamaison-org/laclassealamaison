class Administration::UsersController < ApplicationController
  def index
    @users = User.simple_users.order(created_at: :desc)
    authorize [:administration, :user], :index?
  end
  
  def impersonate
    return unless Rails.env.development?
    impersonate_user(User.find(params[:user_id]))
    redirect_to root_path
  end
end
