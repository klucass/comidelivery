class Cupom < ActiveRecord::Base
	belongs_to :restaurante
	has_many :usuarios, through: :pedido
	validates_associated :restaurante
end
