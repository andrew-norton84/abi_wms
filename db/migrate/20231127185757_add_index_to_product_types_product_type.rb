class AddIndexToProductTypesProductType < ActiveRecord::Migration[7.1]
  def change
    add_index :product_types, :product_type, unique: true
  end
end
