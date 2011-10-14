# -*- encoding : utf-8 -*-
class Pais < ActiveRecord::Base

  has_many :estados
  has_many :municipios, :through => :estado

  validates_presence_of :nome

  validates_uniqueness_of :nome

end
