require 'test_helper'

class PassengerMailerTest < ActionMailer::TestCase
  test "sucessful_booking" do
    mail = PassengerMailer.sucessful_booking
    assert_equal "Sucessful booking", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
