class NewslettersController < ApplicationController
  def new
    @newsletter = NewsletterForm.new
  end

  def create
    @newsletter = NewsletterForm.new(newsletter_params)
    if @newsletter.deliver
      redirect_to root_path, notice: 'Merci pour votre inscription à la newsletter.'
    else
      render :new
    end
  end

  private

  def newsletter_params
    params.require(:newsletter_form).permit(:first_name, :email, classrooms: [])
  end
end
