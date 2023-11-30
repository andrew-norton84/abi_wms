class ProductType < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :location_properties, dependent: :destroy
  before_save   :uppercase_product_type
  before_save   :uppercase_short_desc
  validates :product_type,  presence: true, length: { maximum: 4 },
      uniqueness: true
  validates :short_desc,  presence: true, length: { maximum: 4 }
  validates :description,  presence: true, length: { maximum: 20 }

  private

  # Converts name to all uppercase.
  def uppercase_product_type
    self.product_type = product_type.upcase
  end

  # Converts name to all uppercase.
  def uppercase_short_desc
    self.short_desc = short_desc.upcase
  end
end
