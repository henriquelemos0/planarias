class Subfamilia < ActiveRecord::Base

  belongs_to :familia
  has_many :generos

end
