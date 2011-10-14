# -*- encoding : utf-8 -*-
class CreateEspeciesArtigos < ActiveRecord::Migration
  def self.up 
    create_table :artigos_especies, :id => false do |t|
      t.integer :especie_id, :null => false, :options => "CONSTRAINT fk_artigosespecies_especie REFERENCES especies(id)"
      t.integer :artigo_id, :null => false, :options => "CONSTRAINT fk_artigosespecies_artigo REFERENCES artigo(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :artigos_especies
  end
end
