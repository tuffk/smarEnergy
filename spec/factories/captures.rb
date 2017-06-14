FactoryGirl.define do
  factory :capture do
    device
    start Time.zone.now
    stop 5.minutes.from_now
    amount 7.6
  end
end
