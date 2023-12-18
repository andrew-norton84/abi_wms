class AddFiltersToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :warehouse_division, null: true
    add_reference :users, :location_type, null: true
  end
end