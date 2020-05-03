class Teachers::CoursesController < ApplicationController
  before_action :authenticate_user!
  layout 'teacher'

  def index
    @courses = policy_scope(Course)
    authorize Course
  end

  def create
    @course = current_user.courses.create!(course_params)
    authorize @course
    redirect_to teachers_course_path(@course)
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

  def show
    @course = current_user.courses.find(params[:id])

    animations = @course.classroom_animations

    @current_classroom_animations = animations.live.order(starts_at: :asc)

    @future_classroom_animations = animations.where('starts_at > ?', DateTime.now - 1.hour).order(starts_at: :asc)
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :content, :classroom_id, :published)
  end
end
