class Beach < ApplicationRecord
  has_many :favorite
  has_many :users, through: :favorite
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  has_one_attached :featured_image
  validates :name, :country, :city, :rating, :details, presence: true

  scope :by_name, lambda { |name|
    where('lower(name) LIKE :term or country LIKE :term', { term: "%#{name.downcase}%" })
  }
end
