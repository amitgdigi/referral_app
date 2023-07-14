require "test_helper"

class ReferralMailerTest < ActionMailer::TestCase
  test "refer_through_email" do
    mail = ReferralMailer.refer_through_email
    assert_equal "Refer through email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
