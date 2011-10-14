# -*- encoding : utf-8 -*-
class RenameTipoCaracteristica < ActiveRecord::Migration
  def self.up
    rename_table :tipo_caracteristicas, :alternativas
  end

  def self.down
    rename_table :alternativas, :tipo_caracteristicas
  end
end
