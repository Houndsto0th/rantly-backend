class RantsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    if params[:query].present?
      render json: Rant.where("title like ? OR body like ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      render json: Rant.all
    end

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

  def update
    @rant = Rant.find(params[:id])
    if @rant.update(rant_params)
      render json: @rant
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    head :no_content
  end


  private
  def rant_params
    params.require(:rant).permit(:title, :body, :user, :user_id, :created_at)
  end
end
