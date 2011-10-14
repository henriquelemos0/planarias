# -*- encoding : utf-8 -*-
class Caracteristica < ActiveRecord::Base

  has_many :alternativas

  validates_presence_of :nome

  validates_uniqueness_of :nome

end
