class AdminNotificationMailer < ApplicationMailer
  def newuser(user)
    @user = user
    mail(to: "contact.lcalm@gmail.com", subject: "Nouvel utilisateur : #{user.email}")
  end
end
