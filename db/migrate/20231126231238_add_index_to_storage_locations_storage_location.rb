class AddIndexToStorageLocationsStorageLocation < ActiveRecord::Migration[7.1]
  def change
    add_index :storage_locations, :storage_location, unique: true
  end
end
