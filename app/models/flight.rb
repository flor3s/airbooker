class Flight < ApplicationRecord
  belongs_to :origin, :class_name => "Airport"
  belongs_to :destination, :class_name => "Airport"

  validates :departure_time, presence: true
  validates :duration, presence: true
  validates :origin_id, presence: true
  validates :destination_id, presence: true

  def formatted_date
  	departure_time.strftime("%b %d %Y")
  end
end