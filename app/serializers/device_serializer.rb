class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :area, :brand, :job, :resource_type, :house_id
end
