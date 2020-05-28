class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :date, :duration, presence: true
end
