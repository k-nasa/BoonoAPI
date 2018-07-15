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

  def new_info
    user = User.find_by(token: params[:token])
    render json: user.new_info, status: :ok
  rescue => e
    render json: e, status: :internal_server_error
  end
end
