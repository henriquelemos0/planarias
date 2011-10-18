# -*- encoding : utf-8 -*-
class Caracteristica < ActiveRecord::Base

  has_many :alternativas

  validates :nome, :presence => true, :uniqueness => true

end
