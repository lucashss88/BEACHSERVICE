class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.float :valor_total
      t.boolean :status
      t.integer :numero_mesa
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
