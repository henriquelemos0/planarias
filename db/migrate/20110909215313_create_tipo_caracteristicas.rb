# -*- encoding : utf-8 -*-
class CreateTipoCaracteristicas < ActiveRecord::Migration
  def self.up
    create_table :tipo_caracteristicas do |t|
      t.string :nome, :null => false
      t.integer :caracteristica_id, :null => false, :options => "CONSTRAINT fk_tipo_caracteristica_caracteristica REFERENCES caracteristicas(id)"
      t.string :nome_imagem
      t.string :content_type
      t.binary :imagem

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_caracteristicas
  end
end
