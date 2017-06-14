class House < ApplicationRecord
  belongs_to :user
  has_many :device
  validates :address, presence: true, length: { minimum: 8 }

  def energy_total
    all = Device.where(resource_type: Device::RType::POWER, house: self)
    total = 0.0
    unless all.nil? || all == []
      all.each do |dev|
        total += dev.capture.sum('amount')
      end
      total
    end
    # Device.find_by(resource_type: Device::RType::POWER).capture.sum('amount') unless Device.find_by(resource_type: Device::RType::POWER).nil?
  end

  def water_total
    all = Device.where(resource_type: Device::RType::WATER, house: self)
    total = 0.0
    unless all.nil? || all == []
      all.each do |dev|
        total += dev.capture.sum('amount')
      end
      total
    end
    # Device.find_by(resource_type: Device::RType::WATER).capture.sum('amount') unless Device.find_by(resource_type: Device::RType::WATER).nil?
  end

  def energy_p
    total = energy_total
    unless Device.find_by(resource_type: Device::RType::POWER).nil?
      temp = device.where(resource_type: Device::RType::POWER)#.capture.sum('amount')
      mine = 0.0
      temp.each do |d|
        mine += d.capture.sum('amount')
      end
      (mine / total) * 100
    end
  end

  def water_p
    total = water_total
    unless Device.find_by(resource_type: Device::RType::WATER).nil?
      temp = device.where(resource_type: Device::RType::WATER)#.capture.sum('amount')
      mine = 0.0
      temp.each do |d|
        mine += d.capture.sum('amount')
      end
      (mine / total) * 100
    end
  end
end
