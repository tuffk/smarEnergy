# +Capture+ model
class Capture < ApplicationRecord
  belongs_to :device
  validates :start, :amount, presence: true
end
