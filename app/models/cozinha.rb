class Cozinha < ActiveRecord::Base
	has_many :restaurantes
	validates_presence_of :nome, msg: "Nome deve ser preenchido"
end
