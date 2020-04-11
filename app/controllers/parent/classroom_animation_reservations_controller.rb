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
  end

  def update
    @car = current_user.classroom_animation_reservations.find(params[:id])
    @car.update!(car_params)
    redirect_to parent_classroom_animation_reservations_path
  end

  def destroy
    @car = current_user.classroom_animation_reservations.find(params[:id])
    @car.update!(status: :canceled)
    redirect_to parent_classroom_animation_reservations_path
  end

  def new
    @car = current_user.classroom_animation_reservations.build
  end

  private

  def car_params
    params.require(:classroom_animation_reservation).permit(:child_id, :classroom_animation_id)
  end
end
