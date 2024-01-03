class WarehouseLocation < ApplicationRecord
  include Filterable
  scope :filter_by_warehouse_division_id, -> (warehouse_division_id) { where warehouse_division_id: warehouse_division_id }
  scope :filter_by_location_type_id, -> (location_type_id) { where location_type_id: location_type_id }
  scope :filter_by_location, -> (location) { where location: location }
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
