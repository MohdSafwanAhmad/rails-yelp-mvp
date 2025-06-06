class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, ]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end
  
  def edit
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice:  "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
