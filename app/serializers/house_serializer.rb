class HouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :area, :rooms, :address
end
