class AccountsController < ApplicationController

  def stripe_callback
    unless params[:error]
      user_id = params[:user_id]    
      code = params[:code]
  
      client = OAuth2::Client.new(
        STRIPE_CLIENT_ID,
        STRIPE_SECRET_KEY, 
        :authorize_url => "https://connect.stripe.com/oauth/authorize", 
        :token_url => "https://connect.stripe.com/oauth/token"
      )
      
      @token = client.auth_code.get_token(code, :redirect_uri => "https://localhost:3000/stripe_callback")
      #@access_token = OAuth2::AccessToken.new(client, @token.token, {:mode => :query, :param_name =>"stripe_user_id"})
      
      save_data = {
        :user_id => current_user.id,
        :access_token => @token.token,
        :refresh_token => @token.refresh_token,
        :scope => @token.params[:scope],
        :stripe_publishable_key => @token.params['stripe_publishable_key'],
        :stripe_user_id => @token.params['stripe_user_id']
      }
      Account.delete_all(['user_id = ?', current_user.id])
      @account = Account.new(save_data)
      @account.save
      flash[:notice] = "You are connected to Stripe successfully"
    else
      flash.now[:error] = params[:error]
    end
    
    render 'index'
    
  end  

end
