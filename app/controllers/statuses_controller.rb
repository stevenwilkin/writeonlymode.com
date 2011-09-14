class StatusesController < ApplicationController
  def index
    @current_user = current_user
    if @current_user
      render :index
    else
      render :splash
    end
  end

  def update
    unless current_user
      return
    end

    Twitter.configure do |config|
      config.consumer_key = 'llyJM02BwgKpYi1p82u14w'
      config.consumer_secret = 'JzvuiMMztb5PUrGUC3oAb6HCUE4r9ecQ8GjK7cFXBLs'
      config.oauth_token = current_user.oauth_token
      config.oauth_token_secret = current_user.oauth_secret
    end
    
    @status = params[:status]
    Twitter.update(@status)
  end

end
