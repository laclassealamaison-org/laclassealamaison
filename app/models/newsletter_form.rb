class NewsletterForm < MailForm::Base
  attribute :first_name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :classrooms

  def headers
    {
      subject: 'Inscription à la newsletter de laclassealamaison.org',
      to: 'contact@laclassealamaison.org',
      from: %("#{first_name}" via laclassealamaison.org <contact@laclassealamaison.org>)
    }
  end
end
