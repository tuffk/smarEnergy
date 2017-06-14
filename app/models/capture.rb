class Capture < ApplicationRecord
  belongs_to :device
  validates :start, :stop, :amount, presence: true
end
