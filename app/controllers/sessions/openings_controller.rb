class Sessions::OpeningsController < ApplicationController
  def create
    @session = Session.find(params[:session_id])
    authorize @session
    @session.update(opened: true)
    redirect_to session_path(@session)
  end
end
