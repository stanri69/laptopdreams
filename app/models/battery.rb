class Battery < ApplicationRecord
  validates :battery_capacity, presence: true, uniqueness: true
  has_many :laptops
end
