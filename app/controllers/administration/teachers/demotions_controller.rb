class Administration::Teachers::DemotionsController < ApplicationController
  def create
    @teacher = User.find(params[:teacher_id])
    authorize [:administration, :teachers, :demotion], :create?
    @teacher.update(role: :user)
    redirect_to administration_users_path
  end
end
