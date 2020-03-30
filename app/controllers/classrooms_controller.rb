class ClassroomsController < ApplicationController
  def index
    authorize Classroom
    @classrooms = Classroom.order(:position)
  end

  def show
    @classroom = Classroom.find(params[:id])
    authorize @classroom

    @upcoming_sessions = @classroom.classroom_animations.upcoming
    @live_session = @classroom.classroom_animations.live.open.first
    @resources = @classroom.resources
  end
end
