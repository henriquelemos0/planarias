# -*- encoding : utf-8 -*-
class Subfamilia < ActiveRecord::Base

  belongs_to :familia
  has_many :generos

  validates_presence_of :nome
  validates_presence_of :familia_id

  validates_uniqueness_of :nome
  
end
