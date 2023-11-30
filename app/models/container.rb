class Container < ApplicationRecord
  belongs_to :warehouse_division
  belongs_to :location_type
  belongs_to :warehouse_location
  belongs_to :storage_location
  belongs_to :stock_type
  belongs_to :product
end
