class SharesController < ApplicationController
  def new; end

  def index; end

  def create
    if params[:email]
      ReferralMailer.refer_through_email(current_user, new_user_registration_url, params[:email]).deliver_now
      flash[notice:] = 'Mail sended'
    else
      flash[alert:] = 'Went Wrong'
    end
    redirect_to root_path
  end
end
