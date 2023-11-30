class WarehouseDivision < ApplicationRecord
  belongs_to :country
  has_many :containers, dependent: :destroy
  before_save   :uppercase_division
  validates :division,  presence: true, length: { maximum: 4 },
      uniqueness: { case_sensitive: false }
  validates :description,  presence: true, length: { maximum: 30 }

  private

  # Converts division to all uppercase.
  def uppercase_division
    self.division = division.upcase
  end

end