# app/mailers/transaction_mailer.rb
class PedidoMailer < MandrillMailer::TemplateMailer
  require 'application_helper'

  default from: 'no-reply@comidelivery.com', from_name: 'Comidelivery.com'
 
  def novo(pedido)
    endereco = ""
    endereco << "<li> <strong>Logradouro:</strong> " + pedido.endereco.logradouro + "</li>"
    endereco << "<li> <strong>Endereco:</strong> " + pedido.endereco.endereco + "</li>"
    endereco << "<li> <strong>Numero:</strong> " + pedido.endereco.numero + "</li>"
    endereco << "<li> <strong>Ponto de referência:<strong> " + pedido.endereco.ponto_referencia + "</li>"
    endereco << "<li> <strong>CEP:</strong> " + pedido.endereco.cep + "</li>"
    endereco << "<li> <strong>Cidade:</strong> " + pedido.endereco.cidade + "/" + pedido.endereco.estado + "</li>"

    itens = ""

    pedido.item_pedidos.each do |itemp|
      itens << "<li> #{itemp.quantidade} x #{itemp.item.nome} </li>"

    end

    


   
    mandrill_mail template: 'novo-pedido',
      subject: "Novo pedido pelo site - #{pedido.restaurante.try(:nome)}",
      "to": [
        {email: pedido.restaurante.usuario.try(:email), name: pedido.restaurante.try(:nome)},
        {email: "contato@comidelivery.com", "type": "bcc"},
        
    ],
      vars: {
        'ID' => pedido.id,
        'HORA' => Time.zone.at(pedido.updated_at).strftime("%d/%m/%Y - %H:%M"),
        'VALOR' => centavos_em_real(pedido.preco_total),
        'ITENS' => itens,
        'COMENTARIO' => pedido.try(:comentario),
        'CLIENTE' => pedido.usuario.nome,
        'TELEFONE' => pedido.usuario.telefone,
        'ENDERECO' => endereco,
        'RESTAURANTE' => pedido.restaurante.try(:nome)

      },
      important: true,
      inline_css: true,
      async: true
  end
  private
  # por algum motivo desconhecido, mailers nao aceitam `ajuda` de helpers :(
  # por esse motivo, esta funcao essencial foi escrita na mesma classe. Corrigir assim que possivel.
  def centavos_em_real(centavos)
    dinheiro = Money.new(centavos, "BRL")

    "R$ " + dinheiro.to_s    
  end
end