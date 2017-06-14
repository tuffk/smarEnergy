class House < ApplicationRecord
  belongs_to :user
  has_many :device
  validates :address, presence: true, length: { minimum: 8 }

  def energy_total
    Device.find_by(resource_type: Device::RType::POWER).capture.sum('amount')
  end
end
