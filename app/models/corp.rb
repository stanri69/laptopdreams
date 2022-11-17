class Corp < ApplicationRecord
  validates :color, presence: true, uniqueness: true
  has_many :laptops
end
