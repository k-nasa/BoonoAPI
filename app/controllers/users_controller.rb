class UsersController < ApplicationController
  def create
    user = User.create!
    render json: user.token
  rescue
    render json: 'error'
  end

  def update
    user = User.find_by(token: params[:token])
    user.update!(device_token: params[:device_token])
    render json: :ok
  rescue => e
    render json: e
  end
end
