class PizzaPedido < ActiveRecord::Base
  belongs_to :pedidos
  belongs_to :bordas
  has_one :bordas
  has_many :sabores_de_pizza, :through => :pizza_sabores  
end
