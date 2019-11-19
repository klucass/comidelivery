class PizzaRestaurantes < ActiveRecord::Base
  belongs_to :restaurante
  validates_associated :restaurante
end
