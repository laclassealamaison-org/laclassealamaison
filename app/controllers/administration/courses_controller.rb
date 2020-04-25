class Administration::CoursesController < ApplicationController
  layout 'administration'

  before_action :check_authorization

  def index
    @courses = policy_scope(Course)
    authorize Course
  end

  def create
    @course = policy_scope(Course).create!(course_params)
    authorize @course
    redirect_to administration_courses_path
  end

  def edit
    @course = policy_scope(Course).find(params[:id])
    authorize @course
  end

  def update
    @course = policy_scope(Course).find(params[:id])
    authorize @course
    @course.update!(course_params)
    redirect_to administration_courses_path
  end

  def new
    @course = policy_scope(Course).build
    authorize @course
  end

  private

  def check_authorization
    authorize %i[administration courses]
  end

  def course_params
    params.require(:course).permit(:title, :description, :content, :user_id, :classroom_id, :published)
  end
end
