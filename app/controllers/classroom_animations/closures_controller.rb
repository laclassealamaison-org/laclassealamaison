class ClassroomAnimations::ClosuresController < ApplicationController
  def create
    @classroom_animation = ClassroomAnimation.find(params[:classroom_animation_id])
    authorize @classroom_animation
    @classroom_animation.update(opened: false)
    redirect_to classroom_animation_path(@classroom_animation)
  end
end
