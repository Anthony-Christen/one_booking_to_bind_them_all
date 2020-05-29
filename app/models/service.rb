class Service < ApplicationRecord
  CATEGORIES = %w(Action Shooting Strategy Multiplayer)
  has_many :bookings
  belongs_to :user

  validates :name, :description, :price, :category, :photo, presence: true
  has_one_attached :photo
end
