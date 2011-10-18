# -*- encoding : utf-8 -*-
class Pais < ActiveRecord::Base

  has_many :estados
  has_many :municipios, :through => :estado

  validates :nome, :presence => true, :uniqueness => true

end
