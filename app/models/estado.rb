# -*- encoding : utf-8 -*-
class Estado < ActiveRecord::Base

  belongs_to :pais
  has_many :municipios

  validates :nome, :presence => true, :uniqueness => {:scope => :pais_id}
  validates :pais_id, :presence => true

  
end
