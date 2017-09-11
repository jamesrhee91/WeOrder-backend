# require 'rest-client'

class Api::V1::UserRestaurantsController < ApplicationController

  def create
    restaurant = Restaurant.create(restaurant_params)
    byebug
    # restaurant.update(restaurant_params)
    users_params.each { |user_params|
      user = User.find_or_create_by(user_params)
      UserRestaurant.create(user, restaurant)
    }
  end

  private

  def users_params
    params.require(:users)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

end
