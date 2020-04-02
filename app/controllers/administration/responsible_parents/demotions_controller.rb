class Administration::ResponsibleParents::DemotionsController < ApplicationController
  def create
    @responsible_parent = User.find(params[:responsible_parent_id])
    authorize [:administration, :responsible_parents, :demotion], :create?
    @responsible_parent.update(role: :user)
    redirect_to administration_users_path
  end
end
