class QuestionsController < ApplicationController
  def new
    @question = QuestionForm.new
  end

  def create
    @question = QuestionForm.new(question_params)
    if @question.deliver
      redirect_to root_path, notice: 'Merci pour votre question.'
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question_form).permit(:email, :question, classrooms: [])
  end
end
