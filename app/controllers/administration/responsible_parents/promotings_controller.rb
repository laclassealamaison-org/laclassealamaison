class Administration::ResponsibleParents::PromotingsController < ApplicationController
  def create
    @responsible_parent = User.find(params[:responsible_parent_id])
    authorize [:administration, :responsible_parents, :promoting], :create?
    @responsible_parent.update(role: :responsible_parent)
    redirect_to administration_responsible_parents_path
  end
end
