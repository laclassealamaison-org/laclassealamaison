class ProgressCardsController < ApplicationController

  def index;end

  def new
    @progress_card = ProgressCard.new
  end

  def create
    @progress_card = ProgressCard.new(progress_card_params)
  end

  private

   def progress_card_params
    params.require(:progress_card).permit(:content, :user_id, :child_id)
  end
end
