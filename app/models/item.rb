class Item < ActiveRecord::Base
	belongs_to :categoria
	belongs_to :restaurante
	has_many :pedidos, through: :item_pedidos
	has_many :item_pedidos
	validates_presence_of :nome
	validates_associated :restaurante, :categoria

	mount_uploader :foto_produto, FotoProdutoUploader
end
