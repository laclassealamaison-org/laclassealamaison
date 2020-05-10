class ApplicationController < ActionController::Base
  impersonates :user
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def notify(text)
    return unless ENV['WEBHOOK_URL'].present?

    webhook_body = {
      text: text
    }
    HTTParty.post(
      ENV['WEBHOOK_URL'],
      body: webhook_body.to_json,
      headers: { 'Content-Type': 'application/json' }
    )
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || helpers.home_path_for(resource)
  end

  private

  def user_not_authorized
    flash[:alert] = 'Vous n\'êtes pas autorisé à effectuer cette action.'
    redirect_to(request.referrer || root_path)
  end
end
