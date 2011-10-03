class Especie < ActiveRecord::Base

  has_and_belongs_to_many :municipios
  has_and_belongs_to_many :alternativas
  has_and_belongs_to_many :artigos
  has_and_belongs_to_many :generos
  
  has_many :especie_imagens

  validates_presence_of :nome
  validates_presence_of :bibliografia

  validates_uniqueness_of :nome
  
end
