class Laptop < ApplicationRecord
  validates :battery_id, presence: true
  belongs_to :battery, optional: true

  validates :datalogger_id, presence: true
  belongs_to :datalogger, optional: true

  validates :ram_id, presence: true
  belongs_to :ram, optional: true

  validates :processor_id, presence: true
  belongs_to :processor, optional: true

  validates :connection_id, presence: true
  belongs_to :connection, optional: true

  validates :additionally_id, presence: true
  belongs_to :additionally, optional: true

  validates :corp_id, presence: true
  belongs_to :corp, optional: true

  validates :screen_id, presence: true
  belongs_to :screen, optional: true

  validates :videocard_id, presence: true
  belongs_to :videocard, optional: true

  has_one_attached :image
end
