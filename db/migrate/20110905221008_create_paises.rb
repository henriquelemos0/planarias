class CreatePaises < ActiveRecord::Migration
  def self.up
    create_table :paises do |t|
      t.string :nome, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :paises
  end
end
