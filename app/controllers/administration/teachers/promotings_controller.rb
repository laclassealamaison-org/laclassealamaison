class Administration::Teachers::PromotingsController < ApplicationController
  def create
    @teacher = User.find(params[:teacher_id])
    authorize [:administration, :teachers, :promoting], :create?
    @teacher.update(role: :teacher)
    redirect_to administration_teachers_path
  end
end
