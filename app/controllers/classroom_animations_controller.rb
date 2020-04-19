class ClassroomAnimationsController < ApplicationController
  layout :get_layout

  def index
    authorize ClassroomAnimation
    animations = policy_scope(ClassroomAnimation)
    @current_classroom_animations = animations.live.order(starts_at: :asc)

    @future_classroom_animations = animations.where('starts_at > ?', DateTime.now - 1.hour).order(starts_at: :asc)
  end

  def show
    @classroom_animation = ClassroomAnimation.find(params[:id])
    @reservations = @classroom_animation.classroom_animation_reservations
    authorize @classroom_animation
  end

  def new
    @classroom_animation = ClassroomAnimation.new
    authorize @classroom_animation
    @classroom_animation.user = current_user
    @classroom_animation.starts_at = 1.day.from_now.change(hour: 9)
    @classroom_animation.childrens_maximum = 15
    @classrooms = Classroom.all
  end

  def create
    @classroom_animation = ClassroomAnimation.new(classroom_animation_params)
    authorize @classroom_animation
    @classroom_animation.classroom = @classroom_animation.course&.classroom
    @classroom_animation.user = current_user
    @classroom_animation.live_url = "https://meet.jit.si/" + SecureRandom.hex(12)
    if @classroom_animation.save
      notify("Nouvelle session de #{@classroom_animation.classroom.name} le #{l(@classroom_animation.starts_at, format: "%A %d/%m/%Y à %H:%M")} de #{@classroom_animation.childrens_maximum} enfants maximum par #{@classroom_animation.user.professor_name}")

      redirect_to classroom_animation_path(@classroom_animation)
    else
      @classrooms = Classroom.all
      flash.now[:alert] = @classroom_animation.errors.full_messages
      render :new
    end
  end

  def edit
    @classroom_animation = ClassroomAnimation.find(params[:id])
    authorize @classroom_animation
    @classrooms = Classroom.all
  end

  def update
    @classroom_animation = ClassroomAnimation.find(params[:id])
    authorize @classroom_animation
    if @classroom_animation.update(classroom_animation_params)
      notify("Modification de la session de #{@classroom_animation.classroom.name} le #{l(@classroom_animation.starts_at, format: "%A %d/%m/%Y à %H:%M")} de #{@classroom_animation.childrens_maximum} enfants maximum par #{@classroom_animation.user.professor_name}")

      redirect_to classroom_animation_path(@classroom_animation)
    else
      @classrooms = Classrooms.all
      render :edit
    end
  end

  def destroy
    @classroom_animation = ClassroomAnimation.find(params[:id])
    authorize @classroom_animation
    @classroom_animation.destroy

    notify("Suppression de la session de #{@classroom_animation.classroom.name} le #{l(@classroom_animation.starts_at, format: "%A %d/%m/%Y à %H:%M")} de #{@classroom_animation.childrens_maximum} enfants maximum par #{@classroom_animation.user.professor_name}")

    redirect_to classroom_animations_path
  end

  private

  def get_layout
    current_user.admin? ? "administration" : "teacher"
  end

  def classroom_animation_params
    params.require(:classroom_animation).permit(:classroom_id, :course_id, :starts_at, :childrens_maximum, :comment)
  end
end
