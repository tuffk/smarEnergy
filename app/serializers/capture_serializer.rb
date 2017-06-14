# +Capture+ serializer
class CaptureSerializer < ActiveModel::Serializer
  attributes :id, :start, :stop, :amount, :device_id
end
