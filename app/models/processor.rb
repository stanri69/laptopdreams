class Processor < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :laptops, dependent: :destroy
end
