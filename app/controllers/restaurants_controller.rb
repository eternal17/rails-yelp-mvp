class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  # A visitor can add a new restaurant,
  # and be redirected to the show view of that new restaurant.
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
