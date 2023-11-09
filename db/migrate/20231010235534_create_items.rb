class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :nome
      t.float :preco_unitario
      t.string :descricao
      t.integer :quantidade
      t.string :categoria
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end


  end

end
