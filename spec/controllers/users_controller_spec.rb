require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'should login' do
    u = create(:user)
    process :login, method: :post, params: {
      name: u.name,
      password: u.password
    }
    expect(response.status).to eq(200)
  end

  it 'should not authenticate invalid user' do
    u = create(:user)
    process :login, method: :post, params: {
      name: 'bibiribabiribu',
      password: u.password
    }
    expect(response.status).to eq(401)
  end
end
