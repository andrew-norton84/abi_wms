class Customer < ApplicationRecord
  belongs_to :country
  before_save   :uppercase_customer
  validates :customer,  presence: true, length: { maximum: 10 },
      uniqueness: { case_sensitive: false }
  validates :name,  presence: true, length: { maximum: 40 }

  private

  # Converts division to all uppercase.
  def uppercase_customer
    self.customer = customer.upcase
  end
end
