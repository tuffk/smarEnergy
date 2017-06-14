class CaptureSerializer < ActiveModel::Serializer
  attributes :id, :start, :stop, :amount
end
