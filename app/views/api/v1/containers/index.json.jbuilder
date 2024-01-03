json.containers @containers.each do |c|
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