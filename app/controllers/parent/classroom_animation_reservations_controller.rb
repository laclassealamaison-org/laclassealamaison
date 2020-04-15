class Parent::ClassroomAnimationReservationsController < ApplicationController
  layout "parent"
  def index
    @cars = current_user.classroom_animation_reservations.includes(:classroom_animation).where.not(status: :canceled).order("classroom_animations.starts_at ASC")
  end

  def create
    @car = ClassroomAnimationReservation.new(car_params)
    @car.save!
    redirect_to parent_classroom_animation_reservations_path
  end

  def edit
    @car = current_user.classroom_animation_reservations.find(params[:id])
    @available_children = current_user.children.where.not(id: @car.classroom_animation.children.where.not(id: @car.child))
  end

  def update
    @car = current_user.classroom_animation_reservations.find(params[:id])
    @car.update!(car_params)
    redirect_to parent_classroom_animation_reservations_path
  end

  def destroy
    @car = current_user.classroom_animation_reservations.find(params[:id])
    #@car.update!(status: :canceled)
    @car.destroy!
    redirect_to parent_classroom_animation_reservations_path
  end

  def new
    @car = current_user.classroom_animation_reservations.build
    @car.classroom_animation = ClassroomAnimation.where(id: params[:classroom_animation_id]).first
    @available_children = current_user.children
    if @car.classroom_animation
      @available_children = @available_children.where.not(id: @car.classroom_animation.children.select(:id))
    end
  end

  private

  def car_params
    params.require(:classroom_animation_reservation).permit(:child_id, :classroom_animation_id)
  end
end
