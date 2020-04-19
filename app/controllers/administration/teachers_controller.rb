class Administration::TeachersController < ApplicationController
  include AdministrationUserConcern

  private

  def user_role
    :teacher
  end
end
