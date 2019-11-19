class ConfirmationMailer < ActionMailer::Base
  default from: "no-reply@comidelivery.com"

  def confirm_email(usuario)
  	@usuario = usuario
  	@confirmation_link = confirmation_url({token: @usuario.confirmation_token})

  	 mail(to: @usuario.email, subject: I18n.t('confirm_email.subject'))
  end
  

end
