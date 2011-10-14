# -*- encoding : utf-8 -*-
class Genero < ActiveRecord::Base

  belongs_to :subfamilia
  has_and_belongs_to_many :especies

  validates_presence_of :nome
  validates_presence_of :subfamilia_id

  validates_uniqueness_of :nome
  
end
