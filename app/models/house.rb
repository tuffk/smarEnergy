class House < ApplicationRecord
  belongs_to :user
  has_many :device
  validates :address, presece: true, length: { minimum: 8 }
end
