class UsersController < ApplicationController

  def show
    render json: User.find(params[:user_id])
  end

end
