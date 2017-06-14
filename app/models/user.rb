class User < ApplicationRecord
  has_many :houses
  validates :name, :password, presence: true, length: { in: 3..50 }
end
