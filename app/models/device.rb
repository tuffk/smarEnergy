class Device < ApplicationRecord
  belongs_to :house
  has_many :capture
  validates :brand, :job, presence: true
  validates :resource_type, numericality: { only_integer: true }, presence: true

  module RType
    WATER = 0
    POWER = 1
    LIST = {
      WATER => {},
      POWER => {}
    }.freeze
  end
end
