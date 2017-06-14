u = User.create(name: 'fred', password: '123456')
h1 = House.create(user: u, address: 'tepisco el hoyo # 69', name: 'mi kasa', area: '51',
rooms: 3)
h2 = House.create(user: u, address: 'cañon del sumidero #58', name: 'otra ksa', area: '51',
rooms: 3)
d1h1 = Device.create(house: h1, area: 'living room', brand: 'whirpool', job: 'refrigerator',
resource_type: Device::RType::POWER)
d2h1 = Device.create(house: h1, area: 'living room', brand: 'whirpool', job: 'refrigerator',
resource_type: Device::RType::WATER)
d3h1 = Device.create(house: h1, area: 'kids room', brand: 'tepito', job: 'TV',
resource_type: Device::RType::POWER)

d1h2 = Device.create(house: h2, area: 'living room', brand: 'whirpool', job: 'refrigerator',
resource_type: Device::RType::POWER)
d2h2 = Device.create(house: h2, area: 'living room', brand: 'whirpool', job: 'refrigerator',
resource_type: Device::RType::WATER)
d3h2 = Device.create(house: h2, area: 'kids room', brand: 'tepito', job: 'TV',
resource_type: Device::RType::POWER)

for i in 0..4
  Capture.create(device: d1h1, start: rand(1..100).minutes.ago,
    stop: rand(1..100).minutes.from_now, amount: rand(1..500))
end

for i in 0..1
  Capture.create(device: d2h1, start: rand(1..100).minutes.ago,
    stop: rand(1..100).minutes.from_now, amount: rand(1..500))
end

for i in 0..4
  Capture.create(device: d1h2, start: rand(1..100).minutes.ago,
    stop: rand(1..100).minutes.from_now, amount: rand(1..500))
end

for i in 0..1
  Capture.create(device: d2h2, start: rand(1..100).minutes.ago,
    stop: rand(1..100).minutes.from_now, amount: rand(1..500))
end
