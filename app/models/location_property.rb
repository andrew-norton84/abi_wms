class LocationProperty < ApplicationRecord
  belongs_to :storage_location
  belongs_to :stock_type
  belongs_to :product_type
  validates :property_group,  presence: true, length: { maximum: 10 },
  uniqueness: true
  validates :description,  presence: true, length: { maximum: 30 }

private

# Converts name to all uppercase.
def uppercase_property_group
  self.property_group= property_group.upcase
end

end
