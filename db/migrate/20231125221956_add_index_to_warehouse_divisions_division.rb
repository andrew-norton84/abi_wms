class AddIndexToWarehouseDivisionsDivision < ActiveRecord::Migration[7.1]
  def change
    add_index :warehouse_divisions, :division, unique: true
  end
end
