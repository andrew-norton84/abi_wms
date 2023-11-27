class CreateStorageLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :storage_locations do |t|
      t.integer :storage_location
      t.string :short_desc
      t.string :description

      t.timestamps
    end
  end
end
