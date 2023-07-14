class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :timelines
  after_create :create_referral_code, :check_points

  def create_referral_code
    code = email.split('@').first
    value = id * 2
    code = "#{value}_#{code}_#{rand(value)}"
    update(joining_referral_code: code)
  end

  def check_points
    prev_user = previous_user
    return if prev_user.nil?

    time_lines = Timeline.where(prev_user:)
    if time_lines.length >= 1
      update_points(prev_user, 10)
      update_points(self, 5)
      update_points(time_lines.last.child_user, 5)
      time_lines.destroy_all
    else
      Timeline.create!(prev_user:, child_user: self)
    end
  end

  def update_points(user, value)
    ReferralMailer.refer_through_email(user).deliver_now
    points = user.points
    points += value
    user.update(points:)
  end

  def previous_user
    User.find_by(joining_referral_code: referral_code)
  end
  # User.create!("referral_code"=>"user01", "name"=>"user04", "email"=>"user01@example.com", "password"=>"welcome", "password_confirmation"=>"welcome")
end
