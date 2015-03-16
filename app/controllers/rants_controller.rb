class RantsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]

  def index
    render json: Rant.all
  end

  def show

  end

  def create

  end


end
