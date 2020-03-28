class SessionsController < ApplicationController
  def show
    @session = Session.find(params[:id])
    authorize @session
  end

  def new
    @session = Session.new
    authorize @session
    @session.user = current_user
    @session.scheduled_at = DateTime.now
    @classrooms = Classroom.all
  end

  def create
    @session = Session.new(session_params)
    authorize @session
    @session.user = current_user
    @session.live_url = "https://meet.jit.si/" + SecureRandom.hex(12)
    if @session.save
      redirect_to session_path(@session)
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:classroom_id, :scheduled_at, :childrens_maximum)
  end
end
