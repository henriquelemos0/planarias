class Genero < ActiveRecord::Base

  belongs_to :subfamilia
  has_and_belongs_to_many :especies
  
end
