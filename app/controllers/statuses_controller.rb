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
      redirect_to root_path
      return
    end

    Twitter.configure do |config|
      config.consumer_key = ENV['TWITTER_API_KEY']
      config.consumer_secret = ENV['TWITTER_API_SECRET']
      config.oauth_token = current_user.oauth_token
      config.oauth_token_secret = current_user.oauth_secret
    end
    
    @status = params[:status]
    Twitter.update(@status)

    render :index
  end
end
