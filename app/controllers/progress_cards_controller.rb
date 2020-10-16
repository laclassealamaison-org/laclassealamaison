class ProgressCardsController < ApplicationController

  def index
    @progress_cards = ProgressCard.where(user_id: current_user.id)
  end

  def new
    @progress_card = ProgressCard.new
  end

  def create
    @progress_card = ProgressCard.new(progress_card_params)
    @progress_card.user_id = current_user.id
    if @progress_card.save
      redirect_to teachers_courses_path, notice: "Your card was successfully created."
    else
      render :new
    end
  end

  private

   def progress_card_params
    params.require(:progress_card).permit(:content, :user_id, :child_id)
  end
end
