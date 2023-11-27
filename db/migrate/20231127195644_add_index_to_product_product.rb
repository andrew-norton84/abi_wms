class AddIndexToProductProduct < ActiveRecord::Migration[7.1]
  def change
    add_index :products, :product, unique: true
  end
end