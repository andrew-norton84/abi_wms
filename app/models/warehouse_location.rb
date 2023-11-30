class WarehouseLocation < ApplicationRecord
  belongs_to :warehouse_division
  belongs_to :location_type
  belongs_to :storage_location
  belongs_to :stock_type
  belongs_to :location_property
  has_many :containers, dependent: :destroy
  before_save   :uppercase_location
  validates :location,  presence: true, length: { maximum: 10 },
      uniqueness: { case_sensitive: false }

  private

  # Converts division to all uppercase.
  def uppercase_location
    self.location = location.upcase
  end
end
