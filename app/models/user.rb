class User < ApplicationRecord
  has_many :favorite
  has_many :beaches, through: :favorite
end
