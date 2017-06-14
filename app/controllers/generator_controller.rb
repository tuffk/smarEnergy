# +Generator+ end point
class GeneratorController < ApplicationController
  def generate
    # rubocop:disable UselessAssignment
    user = User.find(params[:uid]) unless params[:uid].nil?
    house = House.find(params[:hid]) unless params[:hid].nil?
    device = Device.find(params[:did]) unless params[:did].nil?
    for i in 1..10 do # rubocop:disable For
      Capture.create(device: device, start: rand(1..100).minutes.ago,
                     stop: rand(1..100).minutes.from_now, amount: rand(1..500))
      sleep(1)
    end
  end
end
# rubocop:enable UselessAssignment
