class Municipio < ActiveRecord::Base

  belongs_to :estado, :include => :pais
  has_and_belongs_to_many :especies

  validates_presence_of :nome
  validates_presence_of :estado_id

  validates_uniqueness_of :nome, :scope => [:estado_id]
  
end
