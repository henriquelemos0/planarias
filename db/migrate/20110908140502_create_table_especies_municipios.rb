# -*- encoding : utf-8 -*-
class CreateTableEspeciesMunicipios < ActiveRecord::Migration
  def self.up
    create_table :especies_municipios, :id => false do |t|
      t.integer :especie_id
      t.integer :municipio_id
    end
  end

  def self.down
    drop_table :especies_municipios
  end
end
