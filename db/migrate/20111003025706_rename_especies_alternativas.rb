class RenameEspeciesAlternativas < ActiveRecord::Migration
  def self.up
    rename_table :especies_alternativas, :alternativas_especies
  end

  def self.down
    rename_table :alternativas_especies, :especies_alterntivas
  end
end
