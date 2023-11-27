class StorageLocation < ApplicationRecord
  before_save   :uppercase_short_desc
  validates :storage_location,  presence: true, length: { maximum: 4 },
      uniqueness: true
  validates :short_desc,  presence: true, length: { maximum: 4 }
  validates :description,  presence: true, length: { maximum: 20 }

  private

  # Converts name to all uppercase.
  def uppercase_stock_type
    self.stock_type = stock_type.upcase
  end

  # Converts name to all uppercase.
  def uppercase_short_desc
    self.short_desc = short_desc.upcase
  end
end