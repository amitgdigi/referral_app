class ReferralMailer < ApplicationMailer

  def refer_through_email(user)
    @greeting = "Hi"
@user = user
    mail to: user.email, subject: "Referral sign-up"
  end
end
