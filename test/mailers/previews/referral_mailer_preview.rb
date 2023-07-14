# Preview all emails at http://localhost:3000/rails/mailers/referral_mailer
class ReferralMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/referral_mailer/refer_through_email
  def refer_through_email
    ReferralMailer.refer_through_email
  end

end
