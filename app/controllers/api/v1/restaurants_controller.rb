require 'rest-client'

class Api::V1::RestaurantsController < ApplicationController

  def index
    url = "https://api.yelp.com/v3/businesses/search?term=#{search_term}&location=#{search_location}"
    headers = {
      Authorization: "Bearer zLzHSzUNTJzDhQDc_CEbcBvxmSkxuJV-pM34nePjTghccxzDxhmOuYWbhuZ9dbHD6Kp3Qi0Q7P8j9mgp423tAM_fDIIq8-cOIKtAJ99pJOctpgDnpSZoRoUfHr-yWXYx"
    }

    response = JSON.parse(RestClient::Request.execute(
      method: :get,
      url: url,
      headers: headers))
    render json: response
  end

  private

  def search_term
    params.require(:term)
  end

  def search_location
    params.require(:location)
  end

end
