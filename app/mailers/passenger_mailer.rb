class PassengerMailer < ApplicationMailer

  def sucessful_booking(passenger)
    @passenger = passenger

    mail to: passenger.email, subject: "Your flight confirmation"
  end
end
