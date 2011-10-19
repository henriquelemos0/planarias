class CreateMembros < ActiveRecord::Migration
  def change
    create_table :membros do |t|
      t.string :nome
      t.text :descricao
      t.string :nome_imagem
      t.string :content_type
      t.binary :imagem

      t.timestamps
    end
  end
end
