class RestaurantsController < ApplicationController
  # before_action :set_restaurant, only [ :show, :reviews ]

  def index 
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = set_restaurant
  end
  
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "Restaurant successfully created"
      redirect_to @restaurant
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end

