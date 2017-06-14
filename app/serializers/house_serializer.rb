class HouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :area, :rooms, :address
  attribute :energy_percentage

  def energy_percentage
    object.energy_total
  end
end
