class CreateEspecies < ActiveRecord::Migration
  def self.up
    create_table :especies do |t|
      t.string :nome
      t.text :bibliografia

      t.timestamps
    end
  end

  def self.down
    drop_table :especies
  end
end
