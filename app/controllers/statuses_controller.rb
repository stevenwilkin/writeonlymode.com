class StatusesController < ApplicationController
  def index
    @current_user = current_user
  end

end
