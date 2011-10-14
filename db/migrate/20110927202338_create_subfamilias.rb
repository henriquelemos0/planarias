# -*- encoding : utf-8 -*-
class CreateSubfamilias < ActiveRecord::Migration
  def self.up
    create_table :subfamilias do |t|
      t.string :nome, :null => false
      t.integer :familia_id, :null => false, :options => "CONSTRAINT fk_subfamilia_familias REFERENCES familias(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :subfamilias
  end
end
