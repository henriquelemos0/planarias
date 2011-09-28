class RenameEspecieImagem < ActiveRecord::Migration
  def self.up
    rename_table :especie_imagems, :especie_imagens
  end

  def self.down
    rename_table :especie_imagens, :especie_imagems
  end
end
