class Familia < ActiveRecord::Base
  
  has_many :subfamilias
  has_many :generos, :through => :subfamilia
  
end
