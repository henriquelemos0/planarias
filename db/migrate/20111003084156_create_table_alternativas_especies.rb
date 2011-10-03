class CreateTableAlternativasEspecies < ActiveRecord::Migration
  def self.up
    create_table :alternativas_especies, :id => false do |t|
      t.integer :especie_id, :null => false, :options => "CONSTRAINT fk_alternativas_especies_especie REFERENCES especies(id)"
      t.integer :alternativa_id, :null => false, :options => "CONSTRAINT fk_alternativas_especies_alternativa REFERENCES alternativas(id)"

      t.timestamps
    end
  end

  def self.down
      drop_table :alternativas_especies
  end
end
