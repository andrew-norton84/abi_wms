class Country < ApplicationRecord
  has_many :warehouse_divisions, dependent: :destroy
  before_save   :uppercase_name
  validates :name,  presence: true, length: { maximum: 4 },
      uniqueness: { case_sensitive: false }
  validates :full_name,  presence: true, length: { maximum: 40 }
end

private

# Converts name to all uppercase.
def uppercase_name
  self.name = name.upcase
end