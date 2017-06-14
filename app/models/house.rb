class House < ApplicationRecord
  belongs_to :user
  has_many :device
  validates :address, presence: true, length: { minimum: 8 }
end
