class CreateContainers < ActiveRecord::Migration[7.1]
  def change
    create_table :containers do |t|
      t.references :warehouse_division, null: false, foreign_key: true
      t.references :location_type, null: false, foreign_key: true
      t.references :warehouse_location, null: false, foreign_key: true
      t.references :storage_location, null: false, foreign_key: true
      t.references :stock_type, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.date :expiry_date
      t.date :manufact_date
      t.string :batch_number
      t.string :reference
      t.string :notes
      t.string :special_stock_type
      t.string :special_text
      t.string :sub_location
      t.integer :secondary_status
      t.string :serial_number
      t.string :last_updated_by

      t.timestamps
    end

    add_index :containers, [:warehouse_division_id, :location_type_id, :warehouse_location_id], unique: false

  end
end
