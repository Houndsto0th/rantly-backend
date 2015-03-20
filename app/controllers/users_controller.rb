class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:delete]
  skip_before_filter :verify_authenticity_token

  def index
    if params[:email].present?
     @users = User.where(email: params[:email])
   else
     @users = User.all
   end
   render json: @users
  end

  def create
    @user = User.new(user_params)
    if  @user.save
      sign_in @user
      render json: @user
    end
  end

  def show
    render json: User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
