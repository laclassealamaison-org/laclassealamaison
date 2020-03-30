class QuestionForm < MailForm::Base
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :question, validate: true
  attribute :classrooms

  def headers
    {
      subject: 'Question via laclassealamaison.org',
      to: 'contact@laclassealamaison.org',
      from: %("#{email}" via laclassealamaison.org <contact@laclassealamaison.org>)
    }
  end
end
