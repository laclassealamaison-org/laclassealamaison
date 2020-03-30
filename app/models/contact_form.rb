class ContactForm < MailForm::Base
  attribute :first_name, validate: true
  attribute :last_name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject, validate: true
  attribute :message, validate: true
  attribute :nickname, captcha: true

  def headers
    {
      subject: subject,
      to: 'contact@laclassealamaison.org',
      from: %("#{first_name} #{last_name} via laclassealamaison.org" <contact@laclassealamaison.org>)
    }
  end
end
