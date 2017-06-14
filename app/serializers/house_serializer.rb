# +House+ serializer
class HouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :area, :rooms, :address, :user_id
  attributes :energy_total, :water_total, :p_percentage, :w_percentage

  def energy_total # rubocop:disable Delegate
    object.energy_total
  end

  def water_total # rubocop:disable Delegate
    object.water_total
  end

  def p_percentage
    object.energy_p
  end

  def w_percentage
    object.water_p
  end
end
