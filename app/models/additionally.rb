class Additionally < ApplicationRecord
  validates :additionally_features, presence: true, uniqueness: true
  has_many :laptops, dependent: :destroy
end
