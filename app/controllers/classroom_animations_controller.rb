class ClassroomAnimationsController < ApplicationController
  layout "teacher"
  def index
    authorize ClassroomAnimation
    model = if current_user.admin?
              ClassroomAnimation
            else
              current_user.classroom_animations
            end
    @current_classroom_animations = model.live.order(starts_at: :asc)

    @future_classroom_animations = model.where('starts_at > ?', DateTime.now - 1.hour).order(starts_at: :asc)
  end

  def show
    @classroom_animation = ClassroomAnimation.find(params[:id])
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
    @classroom_animation.classroom = @classroom_animation.course.classroom
    @classroom_animation.user = current_user
    @classroom_animation.live_url = "https://meet.jit.si/" + SecureRandom.hex(12)
    if @classroom_animation.save
      webhook_body = {
        text: "Nouvelle session de #{@classroom_animation.classroom.name} le #{l(@classroom_animation.starts_at, format: "%A %d/%m/%Y à %H:%M")} de #{@classroom_animation.childrens_maximum} enfants maximum par #{@classroom_animation.user.full_name}"
      }
      HTTParty.post(ENV['WEBHOOK_URL'], body: webhook_body.to_json, headers: { 'Content-Type': 'application/json' })

      redirect_to classroom_animation_path(@classroom_animation)
    else
      @classrooms = Classroom.all
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
      webhook_body = {
        text: "Modification de la session de #{@classroom_animation.classroom.name} le #{l(@classroom_animation.starts_at, format: "%A %d/%m/%Y à %H:%M")} de #{@classroom_animation.childrens_maximum} enfants maximum par #{@classroom_animation.user.full_name}"
      }
      HTTParty.post(ENV['WEBHOOK_URL'], body: webhook_body.to_json, headers: { 'Content-Type': 'application/json' })

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

    webhook_body = {
      text: "Suppression de la session de #{@classroom_animation.classroom.name} le #{l(@classroom_animation.starts_at, format: "%A %d/%m/%Y à %H:%M")} de #{@classroom_animation.childrens_maximum} enfants maximum par #{@classroom_animation.user.full_name}"
    }
    HTTParty.post(ENV['WEBHOOK_URL'], body: webhook_body.to_json, headers: { 'Content-Type': 'application/json' })

    redirect_to classroom_animations_path
  end

  private

  def classroom_animation_params
    params.require(:classroom_animation).permit(:classroom_id, :course_id, :starts_at, :childrens_maximum, :comment)
  end
end
