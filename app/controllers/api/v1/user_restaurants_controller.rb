# require 'rest-client'

class Api::V1::UserRestaurantsController < ApplicationController

  def create

    restaurant = Restaurant.find_by(yelp_id: params[:restaurant][:yelpId])
    if !restaurant
      restaurant = Restaurant.create(yelp_id: params[:restaurant][:yelpId], name: params[:restaurant][:name], address: params[:restaurant][:address])
    end

    params[:users].each { |user_hash|
      user = User.find_by(first_name: user_hash[:name])
      if !user
        user = User.create(first_name: user_hash[:name], password: 'password')
      end
      user_restaurant = UserRestaurant.create(user_id: user.id, restaurant_id: restaurant.id)
      # user.user_restaurants << user_restaurant
      # restaurant.user_restaurants << user_restaurant
    }
    # render :json => {}

  end



end
