class ClassroomsController < ApplicationController
  def index
    authorize Classroom
    @classrooms = Classroom.all
  end

  def show
    authorize @classroom
    @classroom = Classroom.find(params[:id])
  end
end
