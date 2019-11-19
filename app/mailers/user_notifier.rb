class UserNotifier < ActionMailer::Base
  default :from => "Comidelivery <no-reply@mail.comidelivery.com>"
  helper :Application # loads app/helpers/ApplicationHelper.rb

  # send a signup email to the user, pass in the user object that contains the user's email address
  def send_signup_email(usuario)
    @usuario = usuario
    mail( :to => @usuario.email,
    :subject => '🍹 🍔 Bem-vindo ao Comidelivery!  🍱 🍕' )
  end

  def send_precadastro_email(precadastro)
    @precadastro = precadastro
    mail( :to => @precadastro.email,
    :subject => 'Comidelivery - Cadastro de restaurante 🍔 🍱 🍕',:bcc => 'pedidos@comidelivery.com' )
  end

  def send_novo_pedido_email(pedido)
     @pedido = pedido
     mail( :to => @pedido.restaurante.usuario.try(:email),
     :subject => "Comidelivery - Novo pedido ##{@pedido.id}", :bcc => 'pedidos@comidelivery.com')
  end

  def send_pedido_encerrado_email(pedido)
     @pedido = pedido
     mail( :to => @pedido.usuario.email, :subject => "Comidelivery - Pedido recebido com sucesso!", :bcc => "pedidos@comidelivery.com")
  end

  def send_pedido_cancelado_email(pedido)
     @pedido = pedido
     mail( :to => @pedido.usuario.email, :subject => "Comidelivery - Notificação de cancelamento de pedido", :bcc => "pedidos@comidelivery.com")
  end



end
