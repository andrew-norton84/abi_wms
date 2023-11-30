class CreateWarehouseLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :warehouse_locations do |t|
      t.references :warehouse_division, null: false, foreign_key: true
      t.references :location_type, null: false, foreign_key: true
      t.string :location
      t.references :storage_location, null: false, foreign_key: true
      t.references :stock_type, null: false, foreign_key: true
      t.references :location_property, null: false, foreign_key: true
      t.string :special_stock_type
      t.string :special_text
      t.string :drop_zone
      t.string :loc_status
      t.decimal :latitude, precision: 6, scale: 5
      t.decimal :longitude, precision: 6, scale: 5
      t.string :last_updated_by

      t.timestamps
    end

    add_index :warehouse_locations, [:warehouse_division_id, :location_type_id, :location], unique: true

  end
end
