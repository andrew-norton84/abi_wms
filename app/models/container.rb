class Container < ApplicationRecord
  attr_accessor :product_string, :location_string
  belongs_to :warehouse_division
  belongs_to :location_type
  belongs_to :warehouse_location
  belongs_to :storage_location
  belongs_to :stock_type
  belongs_to :product
  before_validation   :uppercase_product_string
  before_validation   :uppercase_location_string
  validates :batch_number, length: { maximum: 20 }
  validates :reference, length: { maximum: 20 }
  validates :notes, length: { maximum: 20 }
  validates :special_stock_type, length: { maximum: 1 }
  validates :sub_location, length: { maximum: 10 }
  validates :serial_number, length: { maximum: 20 }
  validates :last_updated_by, length: { maximum: 10 }

  private

  # Converts division to all uppercase.
  def uppercase_product_string
    self.product_string = product_string.upcase
  end

  # Converts division to all uppercase.
  def uppercase_location_string
    self.location_string = location_string.upcase
  end
end
