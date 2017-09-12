# require 'rest-client'

class Api::V1::UsersController < ApplicationController

  # method for signing up --- creating a new user and sending him back with a token
  def create
    @user = User.new(first_name: params[:name], password: params[:password])
    if @user.save
      payload = { user_id: @user.id}
      render json: {user: @user, jwt: issue_token(payload)}
      ## send some message for success
    else
      ## send some error message
    end
  end


end
