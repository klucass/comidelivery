class Endereco < ActiveRecord::Base
	belongs_to :usuario
	belongs_to :restaurante
	validates_presence_of :nome
	validates_presence_of :estado
	validates_presence_of :cidade
	validates_presence_of :numero
	validates_presence_of :endereco
	validates_associated :usuario
end
