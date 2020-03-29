class ClassroomAnimationsController < ApplicationController
  def index
    @current_classroom_animations = current_user.classroom_animations
                                                .live
                                                .order(starts_at: :asc)

    @future_classroom_animations = current_user.classroom_animations
                                                .where('starts_at > ?', DateTime.now - 1.hour)
                                                .order(starts_at: :asc)
  end

  def show
    @classroom_animation = ClassroomAnimation.find(params[:id])
    authorize @classroom_animation
  end

  def new
    @classroom_animation = ClassroomAnimation.new
    authorize @classroom_animation
    @classroom_animation.user = current_user
    @classroom_animation.starts_at = DateTime.now
    @classrooms = Classroom.all
  end

  def create
    @classroom_animation = ClassroomAnimation.new(classroom_animation_params)
    authorize @classroom_animation
    @classroom_animation.user = current_user
    @classroom_animation.live_url = "https://meet.jit.si/" + SecureRandom.hex(12)
    if @classroom_animation.save
      redirect_to classroom_animation_path(@classroom_animation)
    else
      @classrooms = Classroom.all
      render :new
    end
  end

  private

  def classroom_animation_params
    params.require(:classroom_animation).permit(:classroom_id, :starts_at, :childrens_maximum)
  end
end
