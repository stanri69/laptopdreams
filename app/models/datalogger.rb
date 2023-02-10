class Datalogger < ApplicationRecord
  validates :type_datalogger, presence: true, uniqueness: true
  has_many :laptops
end
