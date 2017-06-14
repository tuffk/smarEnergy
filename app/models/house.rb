class House < ApplicationRecord
  belongs_to :user
  has_many :device
  validates :address, presence: true, length: { minimum: 8 }

  def energy_total
    Device.find_by(resource_type: Device::RType::POWER).capture.sum('amount') unless Device.find_by(resource_type: Device::RType::POWER).nil?
  end

  def water_total
    Device.find_by(resource_type: Device::RType::WATER).capture.sum('amount') unless Device.find_by(resource_type: Device::RType::WATER).nil?
  end

  def energy_p
    total = energy_total
    unless Device.find_by(resource_type: Device::RType::POWER).nil?
      mine = device.find_by(resource_type: Device::RType::POWER).capture.sum('amount')
      (mine / total) * 100
    end
  end

  def water_p
    total = water_total
    unless Device.find_by(resource_type: Device::RType::WATER).nil?
      mine = device.find_by(resource_type: Device::RType::WATER).capture.sum('amount')
      (mine / total) * 100
    end
  end
end
