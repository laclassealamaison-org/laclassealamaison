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
    HTTParty.post(ENV['WEBHOOK_URL'], body: webhook_body.to_json, headers: { 'Content-Type': 'application/json' })
  end

  private

  def user_not_authorized
    flash[:alert] = 'Vous n\'êtes pas autorisé à effectuer cette action.'
    redirect_to(request.referrer || root_path)
  end
end
