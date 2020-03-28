class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'Vous n\'êtes pas autorisé à effectuer cette action.'
    redirect_to(request.referrer || root_path)
  end
end
