class Artigo < ActiveRecord::Base

  has_and_belongs_to_many :especies

  validates_presence_of :nome
  validates_presence_of :link

  validates_uniqueness_of :nome
  
end
