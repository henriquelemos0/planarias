class Familia < ActiveRecord::Base
  
  has_many :subfamilias
  has_many :generos, :through => :subfamilia

  validates_presence_of :nome

  validates_uniqueness_of :nome
  
end
