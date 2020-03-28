class ClassroomsController < ApplicationController
  def index
    @classrooms = Classroom.all
    authorize Classroom
  end

  def show
    @classroom = Classroom.find(params[:id])
    authorize @classroom
  end
end
