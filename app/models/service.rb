class Service < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, :description, :price, :category, presence: true
end
