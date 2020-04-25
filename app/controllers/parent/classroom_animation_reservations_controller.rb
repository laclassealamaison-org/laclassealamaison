class Parent::ClassroomAnimationReservationsController < ApplicationController
  before_action :authenticate_user!
  layout 'parent'
  def index
    @cars = policy_scope(ClassroomAnimationReservation).includes(:classroom_animation).order('classroom_animations.starts_at ASC')
  end

  def create
    @car = ClassroomAnimationReservation.new(car_params)
    authorize @car
    @car.save!
    redirect_to parent_classroom_animation_reservations_path, notice: 'L\'inscription a été effectuée avec succès.'
  end

  def edit
    @car = current_user.classroom_animation_reservations.find(params[:id])
    authorize @car
    @available_children = current_user.children.where.not(id: @car.classroom_animation.children.where.not(id: @car.child))
  end

  def update
    @car = current_user.classroom_animation_reservations.find(params[:id])
    authorize @car
    @car.update!(car_params)
    redirect_to parent_classroom_animation_reservations_path
  end

  def destroy
    @car = current_user.classroom_animation_reservations.find(params[:id])
    authorize @car
    @car.destroy!
    redirect_to parent_classroom_animation_reservations_path, notice: 'La désinscription a été effectuée avec succès.'
  end

  def new
    @car = current_user.classroom_animation_reservations.build
    @car.classroom_animation = ClassroomAnimation.where(id: params[:classroom_animation_id]).first
    @available_children = current_user.children
    if @car.classroom_animation
      @available_children = @available_children.where.not(id: @car.classroom_animation.children.select(:id))
    end
    authorize @car
  end

  private

  def car_params
    params.permit(:child_id, :classroom_animation_id)
  end
end
