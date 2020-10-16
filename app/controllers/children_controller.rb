class ChildrenController < ApplicationController
  before_action :authenticate_user!
  layout 'parent'
  def index
    @children = current_user.children
  end

  def create
    @child = current_user.children.create!(child_params)
    redirect_to @child
  end

  def edit
    @child = current_user.children.find(params[:id])
    authorize @child
  end

  def show
    @child = current_user.children.find(params[:id])
    @classroom_animation_reservation = ClassroomAnimationReservation.new
    @progress_cards = ProgressCard.where(child_id: @child.id)
  end

  def update
    @child = current_user.children.find(params[:id])
    authorize @child
    @child.update!(child_params)
    redirect_to children_path
  end

  def destroy
    @child = current_user.children.find(params[:id])
    authorize @child
    @child.destroy!
    redirect_to children_path
  end

  def new
    @child = current_user.children.build
  end

  private

  def child_params
    params.require(:child).permit(:name, :classroom_id)
  end
end
