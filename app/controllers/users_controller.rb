class UsersController < ApplicationController
  def create
    user = User.create!
    render json: user.token
  rescue
    render json: 'error'
  end
end
