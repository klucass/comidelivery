# app/mailers/transaction_mailer.rb
class CadastroMailer < MandrillMailer::TemplateMailer
  default from: 'contato@comidelivery.com', from_name: 'Equipe Comidelivery'
 
  def welcome(user)
    mandrill_mail template: 'bem-vindo',
      subject: "Bem vindo ao Comidelivery!",
      to: {email: user.email, name: user.nome},
      vars: {
        'USER_IDENTIFIER' => user.email,
        'LIST_COMPANY' => 'Comidelivery',
        'USERNAME' => user.nome
      },
      important: true,
      inline_css: true,
      async: true
  end
end
