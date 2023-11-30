class CreateLocationProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :location_properties do |t|
      t.string :property_group
      t.string :description
      t.integer :loc_height
      t.integer :loc_width
      t.integer :loc_depth
      t.integer :no_of_skus
      t.integer :no_of_batches
      t.references :storage_location, null: false, foreign_key: true
      t.references :stock_type, null: false, foreign_key: true
      t.references :product_type, null: false, foreign_key: true
      t.string :replen_zone
      t.string :count_zone
      t.boolean :exist_empty
      t.boolean :create_on_fly

      t.timestamps
    end

    add_index :location_properties, :property_group, unique: true

  end
end
