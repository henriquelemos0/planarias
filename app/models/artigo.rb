class Artigo < ActiveRecord::Base

  has_and_belongs_to_many :especies
  
end
