# -*- encoding : utf-8 -*-
class Subfamilia < ActiveRecord::Base

  belongs_to :familia
  has_many :generos

  validates :nome, :presence => true, :uniqueness => true
  validates :familia_id, :presence => true
  
end
