class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :timelines
  after_create :create_referral_code, :hit_referral

  def create_referral_code
    code = email.split('@').first
    update(joining_referral_code: code)
  end

  def hit_referral
    debugger
    code = referral_code
    return if code.blank?

    prev_user = User.find_by(joining_referral_code: code)
    if prev_user.timelines
      p 'he'
      user = timelines.first.user
      point = user.points
      points += 5
      user.update(points:)
      points = prev_user.points
      points += 10
      prev_user.update(points:)
    else
      prev_user.timelines.create!(timeline: 'another_user', user_id: id)
    end
  end
end
# User.create!("referral_code"=>"user01", "name"=>"user04", "email"=>"user01@example.com", "password"=>"welcome", "password_confirmation"=>"welcome")

