class SessionsController < ApplicationController
  def show
    @session = Session.find(params[:id])
  end

  def new
    @session = current_user.sessions.build
    @session.scheduled_at = DateTime.now
    @classrooms = Classroom.all
    authorize @session
  end

  def create
    @session = current_user.sessions.build(session_params)
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
