class ReferralMailer < ApplicationMailer
  def refer_through_email(user,path, email)

    @greeting = 'Hi'
    @user = user

    @link = "#{path}?code=#{user.joining_referral_code}&email=#{email}"
    mail to: user.email, subject: 'Referral sign-up'
  end
end
