class GeneratorController < ApplicationController
  def generate
    user = User.find(params[:uid]) unless params[:uid].nil?
    house = House.find(params[:hid]) unless params[:hid].nil?
    device = Device.find(params[:did]) unless params[:did].nil?
    loop do
      Capture.create(device: device, start: rand(1..100).minutes.ago,
                     stop: rand(1..100).minutes.from_now, amount: rand(1..500))
      sleep(5)
    end
  end
end
