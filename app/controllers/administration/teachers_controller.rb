class Administration::TeachersController < ApplicationController
  def index
    @users = User.teachers.order(created_at: :desc)
    authorize [:administration, :teacher], :index?
  end
end
