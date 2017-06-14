FactoryGirl.define do
  factory :device do
    brand 'tejeringo el chico'
    job 'dish washer'
    house
    resource_type Device::RType::POWER
  end
end
