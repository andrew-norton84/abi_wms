json.locations @warehouse_locations.each do |w|
  json.id w.id
  json.division w.warehouse_division.division
  json.location w.location
  json.location_type w.location_type.location_type
  json.storage_location w.storage_location.storage_location
  json.stock_type w.stock_type.stock_type
  json.property_group w.location_property.property_group
end