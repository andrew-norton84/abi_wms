w = @warehouse_location
json.id w.id
json.division w.warehouse_division.division
json.location w.location
json.location_type w.location_type.location_type
json.storage_location w.storage_location.storage_location
json.stock_type w.stock_type.stock_type
json.property_group w.location_property.property_group

json.containers w.containers.each do |c|
  json.id c.id
  json.product c.product.product
  json.quantity c.quantity
  json.expiry_date c.expiry_date
  json.batch_number c.batch_number
  json.storage_location c.storage_location.storage_location
  json.stock_type c.stock_type.stock_type
  json.reference c.reference
  json.notes c.notes
end