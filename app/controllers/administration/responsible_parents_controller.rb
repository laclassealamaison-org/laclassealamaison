class Administration::ResponsibleParentsController < ApplicationController
  def index
    @users = User.responsible_parents.order(created_at: :desc)
    authorize [:administration, :responsible_parent], :index?
  end
end
