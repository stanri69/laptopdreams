class Screen < ApplicationRecord
  validates :diagonal, presence: true, uniqueness: true
  has_many :laptops
end
