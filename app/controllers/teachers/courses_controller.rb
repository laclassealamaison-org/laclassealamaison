class Teachers::CoursesController < ApplicationController
  layout "teacher"

  def index
    @courses = policy_scope(Course)
    authorize Course
  end

  def create
    @course = current_user.courses.create!(course_params)
    authorize @course
    redirect_to teachers_courses_path
  end

  def edit
    @course = current_user.courses.find(params[:id])
    authorize @course
  end

  def update
    @course = current_user.courses.find(params[:id])
    authorize @course
    @course.update!(course_params)
    redirect_to teachers_courses_path
  end

  def new
    @course = current_user.courses.build
    authorize @course
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :content, :classroom_id, :published)
  end
end