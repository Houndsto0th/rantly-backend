class RantsController < ApplicationController
  before_filter :authenticate_user!, only: [:delete]

  def index
    render json: Rant.all
  end

  def show

  end

  def create
    @rant = Rant.new(rant_params)
    if @rant.save
      render json: @rant, status: :created
    else
      render json: @rant.errors, status: :unprocessable_entity
    end
  end



  private
  def rant_params
    params.require(:rant).permit(:title, :body, :user, :user_id)
  end
end
