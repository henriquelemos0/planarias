class CreateCaracteristicas < ActiveRecord::Migration
  def self.up
    create_table :caracteristicas do |t|
      t.string :nome, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :caracteristicas
  end
end
