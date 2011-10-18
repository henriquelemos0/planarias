# -*- encoding : utf-8 -*-
class Artigo < ActiveRecord::Base

  has_and_belongs_to_many :especies

  validates :nome, :presence => true, :uniqueness => true
  validates :link, :presence => true
  
end
