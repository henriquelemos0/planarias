class CreateArtigos < ActiveRecord::Migration
  def self.up
    create_table :artigos do |t|
      t.string :nome, :null => false
      t.string :link, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :artigos
  end
end
