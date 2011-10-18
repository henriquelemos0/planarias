
class Familia < ActiveRecord::Base
  
  has_many :subfamilias
  has_many :generos, :through => :subfamilia

  validates :nome, :presence => true, :uniqueness => true
  
end
