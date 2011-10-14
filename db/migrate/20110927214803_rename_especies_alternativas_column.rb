# -*- encoding : utf-8 -*-
class RenameEspeciesAlternativasColumn < ActiveRecord::Migration
  def self.up
    rename_column :especies_alternativas, :tipo_caracteristica_id, :alternativa_id
  end

  def self.down
    rename_column :especies_alternativas, :alternativa_id, :tipo_caracteristica_id
  end
end
