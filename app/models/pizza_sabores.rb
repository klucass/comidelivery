class PizzaSabores < ActiveRecord::Base
  belongs_to :pizza_pedidos
  belongs_to :sabores_de_pizza
end
