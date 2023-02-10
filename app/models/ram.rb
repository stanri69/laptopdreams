class Ram < ApplicationRecord
  validates :type_ram, presence: true, uniqueness: true
  has_many :laptops, dependent: :destroy
end
