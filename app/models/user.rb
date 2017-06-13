class User < ApplicationRecord
  has_many :houses
  validates :name, :password, presece: true, length: { in: 3..50 }
end
