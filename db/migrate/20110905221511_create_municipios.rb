class CreateMunicipios < ActiveRecord::Migration
  def self.up
    create_table :municipios do |t|
      t.string :nome, :null => false
      t.integer :estado_id, :null => false, :options => "CONSTRAINT fk_municipio_estado REFERENCES estados(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :municipios
  end
end
