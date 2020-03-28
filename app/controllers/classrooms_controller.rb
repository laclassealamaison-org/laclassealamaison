class ClassroomsController < ApplicationController
  def index
    authorize Classroom
    @classrooms = Classroom.order(:position)
  end

  def show
    @classroom = Classroom.find(params[:id])
    authorize @classroom

    @live_session = @classroom.sessions.live.first
    @resources = @classroom.resources
  end
end
