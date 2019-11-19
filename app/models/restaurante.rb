class Restaurante < ActiveRecord::Base
	belongs_to :usuario
	belongs_to :cozinha
	has_one :endereco
	has_many :itens
	has_many :pizza_restaurantes
	has_many :pedidos
	has_many :sabores_de_pizza
	validates_associated :usuario, :cozinha
	validates_presence_of :usuario_id

	mount_uploader :imagem, ImagemUploader
end
