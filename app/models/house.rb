class House < ApplicationRecord
  belongs_to :user

  validates :address, presece: true, length: { minimum: 8 }
end
