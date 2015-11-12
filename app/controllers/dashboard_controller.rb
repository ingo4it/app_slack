class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def setting    

  end

  def connect
    # if current_user.account.present? && current_user.account.stripe_user_id.present?
    #   redirect_to action: 'setting'
    # end
  end

end
