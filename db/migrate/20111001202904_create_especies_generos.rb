# -*- encoding : utf-8 -*-
class CreateEspeciesGeneros < ActiveRecord::Migration
  def self.up
    create_table :especies_generos, :id => false do |t|
      t.integer :especie_id, :null => false, :options => "CONSTRAINT fk_especiesgeneros_especie REFERENCES especies(id)"
      t.integer :genero_id, :null => false, :options => "CONSTRAINT fk_especiesgeneros_genero REFERENCES genero(id)"
      
      t.timestamps
    end
  end

  def self.down
    drop_table :especies_generos
  end
end
