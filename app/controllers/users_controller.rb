class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:delete]

  def index
    if params[:email].present?
     @users = User.where(email: params[:email])
   else
     @users = User.all
   end
   render json: @users
  end

  def show
    render json: User.find(params[:id])
  end


end
