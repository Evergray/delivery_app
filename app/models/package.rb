class Package < ApplicationRecord
  belongs_to :courier

  validates :tracking_number, presence: true, numericality: { only_integer: true }
  validates_uniqueness_of :tracking_number
end
