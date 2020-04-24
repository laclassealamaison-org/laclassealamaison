class ClassroomsController < ApplicationController
  def index
    authorize Classroom
    @classrooms = Classroom.order(:position)
  end

  def show
    @classroom = Classroom.find(params[:id])
    authorize @classroom

    @upcoming_sessions = @classroom.classroom_animations.upcoming.order(:starts_at)
    @live_session = @classroom.classroom_animations.live.open.first
    @classroom_resources = @classroom.classroom_resources
  end
end
