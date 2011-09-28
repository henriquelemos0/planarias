class CreateGeneros < ActiveRecord::Migration
  def self.up
    create_table :generos do |t|
      t.string :nome, :null => false
      t.integer :subfamilia_id, :options => "CONSTRAINT fk_genero_subfamilia REFERENCES subfamilias(id)"

      t.timestamps
    end
  end

  def self.down
    drop_table :generos
  end
end
