class Especie < ActiveRecord::Base

  has_and_belongs_to_many :municipios
  has_and_belongs_to_many :alternativas
  has_and_belongs_to_many :artigos
  
  has_many :especie_imagens
  
end
