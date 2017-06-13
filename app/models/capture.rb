class Capture < ApplicationRecord
  belongs_to :device
  valdiates :start, :stop, :amount, presece: true
end
