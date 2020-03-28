class Sessions::ClosuresController < ApplicationController
  def create
    @session = Session.find(params[:session_id])
    authorize @session
    @session.update(opened: false)
    redirect_to session_path(@session)
  end
end
