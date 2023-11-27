class Supplier < ApplicationRecord
  belongs_to :country
  before_save   :uppercase_supplier
  validates :supplier,  presence: true, length: { maximum: 10 },
      uniqueness: { case_sensitive: false }
  validates :name,  presence: true, length: { maximum: 40 }

  private

  # Converts division to all uppercase.
  def uppercase_supplier
    self.supplier = supplier.upcase
  end
end
