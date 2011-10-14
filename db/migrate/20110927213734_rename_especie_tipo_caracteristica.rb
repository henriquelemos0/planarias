# -*- encoding : utf-8 -*-
class RenameEspecieTipoCaracteristica < ActiveRecord::Migration
  def self.up
    rename_table :especies_tipo_caracteristicas, :especies_alternativas
  end

  def self.down
    rename_table :especies_alternativas, :especies_tipo_caracteristicas
  end
end
