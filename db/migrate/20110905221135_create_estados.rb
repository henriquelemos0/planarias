class CreateEstados < ActiveRecord::Migration
  def self.up
    create_table :estados do |t|
      t.string :nome, :null => false
      t.integer :pais_id, :null => false, :options => "CONSTRAINT fk_estado_pais REFERENCES paises(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :estados
  end
end
