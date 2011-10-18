# -*- encoding : utf-8 -*-
class Genero < ActiveRecord::Base

  belongs_to :subfamilia
  has_and_belongs_to_many :especies

  validates :nome, :presence => true, :uniqueness => true
  validates :subfamilia_id, :presence => true
  
end
