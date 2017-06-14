class Device < ApplicationRecord
  belongs_to :house
  has_many :capture
  validates :brand, :type, presence: true
end
