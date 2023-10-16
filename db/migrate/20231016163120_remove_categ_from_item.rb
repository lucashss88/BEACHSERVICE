class RemoveCategFromItem < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :categoria, :string
  end
end
