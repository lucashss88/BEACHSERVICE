class CreateItemCategoryEnums < ActiveRecord::Migration[7.0]
  def change
    create_table :item_category_enums do |t|

      t.timestamps
    end
  end
end
