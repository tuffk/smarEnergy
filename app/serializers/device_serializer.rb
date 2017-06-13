class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :area, :brand, :type, :resource_type
end
