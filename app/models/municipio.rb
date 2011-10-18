# -*- encoding : utf-8 -*-
class Municipio < ActiveRecord::Base

  belongs_to :estado, :include => :pais
  has_and_belongs_to_many :especies

  validates :nome, :presence => true, :uniqueness => {:scope => :estado_id}
  validates :estado_id, :presence => true
  
end
