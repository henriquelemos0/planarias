# -*- encoding : utf-8 -*-
class Estado < ActiveRecord::Base

  belongs_to :pais
  has_many :municipios

  validates_presence_of :nome
  validates_presence_of :pais_id

  validates_uniqueness_of :nome, :scope => [:pais_id]
  
end
