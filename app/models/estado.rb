class Estado < ActiveRecord::Base

  belongs_to :pais
  has_many :municipios

  validates_presence_of :nome

end
