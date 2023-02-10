class Connection < ApplicationRecord
  validates :ports, presence: true, uniqueness: true
  has_many :laptops, dependent: :destroy
end
