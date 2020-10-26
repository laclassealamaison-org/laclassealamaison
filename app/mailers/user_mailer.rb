class UserMailer < ApplicationMailer
  def presence_confirmation_mail
    @user = params[:user]
    mail(to: @user.email, subject: 'Un cours prévu demain')
  end
end
