class Administration::ResponsibleParentsController < ApplicationController
  include AdministrationUserConcern

  private

  def user_role
    :responsible_parent
  end
end
