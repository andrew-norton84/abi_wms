class LocationType < ApplicationRecord
  has_many :warehouse_locations, dependent: :destroy
  has_many :containers, dependent: :destroy
  before_save   :uppercase_location_type
  before_save   :uppercase_short_desc
  validates :location_type,  presence: true, length: { maximum: 4 },
      uniqueness: true
  validates :short_desc,  presence: true, length: { maximum: 4 }
  validates :description,  presence: true, length: { maximum: 40 }

  private

  # Converts name to all uppercase.
  def uppercase_location_type
    self.location_type = location_type.upcase
  end

  # Converts name to all uppercase.
  def uppercase_short_desc
    self.short_desc = short_desc.upcase
  end
end
