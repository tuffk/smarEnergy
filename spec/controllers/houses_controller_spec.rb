require 'rails_helper'

RSpec.describe HousesController, type: :controller do
  it 'should vlaidate somehting' do
    h = create(:house)
    d = create(:device, house: h)
    create_list(:capture, 5, device: d)
    process :show, method: :get, params: { id: h.id }
    json =  response_body
    binding.pry
    expect(json[:p_percentage]).to eq(100.to_f.to_s)
    expect(json[:energy_total]).to eq(38.to_f.to_s)
  end
end
