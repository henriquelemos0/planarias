# -*- encoding : utf-8 -*-
class CreateEspecieImagems < ActiveRecord::Migration
  def self.up
    create_table :especie_imagems do |t|
      t.string :nome, :null => false
      t.string :legenda
      t.string :content_type, :null => false
      t.binary :data, :null => false
      t.integer :especie_id, :null => false, :options => "CONSTRAINT fk_especie REFERENCES especies(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :especie_imagems
  end
end
