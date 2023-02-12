class Laptop < ApplicationRecord
  validates :battery_id, presence: true
  belongs_to :battery

  validates :datalogger_id, presence: true
  belongs_to :datalogger

  validates :ram_id, presence: true
  belongs_to :ram

  validates :processor_id, presence: true
  belongs_to :processor

  validates :connection_id, presence: true
  belongs_to :connection

  validates :additionally_id, presence: true
  belongs_to :additionally

  validates :corp_id, presence: true
  belongs_to :corp

  validates :screen_id, presence: true
  belongs_to :screen

  validates :videocard_id, presence: true
  belongs_to :videocard

  validates :seller_id, presence: true
  belongs_to :seller

  has_one_attached :image

  has_many :favorites, dependent: :destroy
end
