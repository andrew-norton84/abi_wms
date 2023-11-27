class Product < ApplicationRecord
  belongs_to :country
  belongs_to :product_type
  before_save   :uppercase_product
  validates :product,  presence: true, length: { maximum: 15 },
      uniqueness: { case_sensitive: false }
  validates :description,  presence: true, length: { maximum: 40 }

  private

  # Converts division to all uppercase.
  def uppercase_product
    self.product = product.upcase
  end
end
