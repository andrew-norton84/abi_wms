class AddIndexToLocationsTypesLocationType < ActiveRecord::Migration[7.1]
  def change
    add_index :location_types, :location_type, unique: true
  end
end
