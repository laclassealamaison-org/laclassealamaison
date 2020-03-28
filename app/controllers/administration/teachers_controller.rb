class Administration::TeachersController < ApplicationController
  def index
    @users = User.not_admin.order(created_at: :desc)
    authorize [:administration, :teacher], :index?
  end
end
