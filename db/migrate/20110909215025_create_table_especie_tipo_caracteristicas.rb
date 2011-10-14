# -*- encoding : utf-8 -*-
class CreateTableEspecieTipoCaracteristicas < ActiveRecord::Migration
  def self.up
    create_table :especie_tipo_caracteristica do |t|
      t.integer :especie_id, :null => false, :options => "CONSTRAINT fk_tipo_caracteristicas_especie REFERENCES especies(id)"
      t.integer :tipo_caracteristica_id, :null => false, :options => "CONSTRAINT fk_especie_tipo_caracteristica REFERENCES tipo_caracteristicas(id)"

      t.timestamps
    end
  end

  def self.down
      drop_table :especie_tipo_Caracteristica
  end
end
