class ContactsController < ApplicationController
  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(contact_params)
    if @contact.deliver
      redirect_to root_path, notice: 'Merci pour votre message.'
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact_form).permit(:first_name, :last_name, :email, :subject, :message, :nickname)
  end
end
