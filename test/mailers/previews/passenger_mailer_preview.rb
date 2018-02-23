# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/passenger_mailer/sucessful_booking
  def sucessful_booking
  	passenger = Passenger.first
    PassengerMailer.sucessful_booking(passenger)
  end

end
