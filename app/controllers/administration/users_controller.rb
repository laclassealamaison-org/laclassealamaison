class Administration::UsersController < ApplicationController
  include AdministrationUserConcern

  def impersonate
    return unless Rails.env.development?

    user = User.find(params[:user_id])
    impersonate_user(user)
    redirect_to helpers.home_path_for(user)
  end

  private

  def user_role
    :user
  end
end
