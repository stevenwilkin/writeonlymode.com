class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_uid(auth['uid']) || User.create(
      :uid => auth['uid'],
      :name => auth['info']['nickname'],
      :oauth_token => auth['credentials']['token'],
      :oauth_secret => auth['credentials']['secret']
    )
    session[:user_id] = user.id

    redirect_to root_path
  end

  def destroy
    @current_user = session['user_id'] = nil
    redirect_to root_path
  end
end
