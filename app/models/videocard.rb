class Videocard < ApplicationRecord
  validates :type_videocard, presence: true, uniqueness: true
  has_many :laptops, dependent: :destroy
end
