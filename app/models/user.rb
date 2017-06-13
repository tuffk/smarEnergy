class User < ApplicationRecord
<<<<<<< HEAD
  has_many :houses
  validates :name, :password, presece: true, length: { in: 3..50 }
=======
>>>>>>> 31643a25fc59e28080ccca3597b7d8a3e40ff1ea
end
