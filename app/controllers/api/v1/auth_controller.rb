class Api::V1::AuthController < ApplicationController

  # method for logging in --- authenticate user and send him back with token
  def create
    user = User.find_by(first_name: params[:name])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id}
      token = issue_token(payload)
      render json: {user: user, jwt: token}
      # a user exists and I can authenticate a user so successs
    else
      render json: {error: "Not Authenticated"}
    end
  end

  def current_user
    something = decoded_token(token)
  end

end
