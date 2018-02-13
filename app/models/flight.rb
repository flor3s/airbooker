class Flight < ApplicationRecord
  belongs_to :origin, :class_name => "Airport"
  belongs_to :destination, :class_name => "Airport"
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings
  validates :departure_time, presence: true
  validates :duration, presence: true
  validates :origin_id, presence: true
  validates :destination_id, presence: true
  accepts_nested_attributes_for :bookings

  def formatted_date
  	departure_time.strftime("%b %d %Y")
  end

  def arrival_time
    departure_time + duration.hours
  end
end