class Teachers::CoursesController < ApplicationController
  before_action :authenticate_user!
  layout 'teacher'

  def index
    @courses = policy_scope(Course).order("published desc", :title)
    authorize Course
    @progress_cards = ProgressCard.where(user_id: current_user.id)
  end

  def cards_index
    @progress_cards = ProgressCard.where(user_id: current_user.id)
  end

  def create
    @course = current_user.courses.build(course_params)
    authorize @course
    if @course.save
      redirect_to new_classroom_animation_path(course_id: @course)
    else
      render :new
    end
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
    @course ||= current_user.courses.build
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
