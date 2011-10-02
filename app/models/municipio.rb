class Municipio < ActiveRecord::Base

  belongs_to :estado, :include => :pais
  has_and_belongs_to_many :especies

  validates_presence_of :nome

  def pais
    municipio.estado.pais
  end
end
