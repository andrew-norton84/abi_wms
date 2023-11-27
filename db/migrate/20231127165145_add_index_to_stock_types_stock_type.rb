class AddIndexToStockTypesStockType < ActiveRecord::Migration[7.1]
  def change
    add_index :stock_types, :stock_type, unique: true
  end
end
