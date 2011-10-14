# -*- encoding : utf-8 -*-
class CreateFamilias < ActiveRecord::Migration
  def self.up
    create_table :familias do |t|
      t.string :nome, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :familias
  end
end
