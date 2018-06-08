class SubscriptionItemsController < ApplicationController
  def index
    user = User.find_by(token: params[:token])
    sub_items = user.subscription_items

    render json: sub_items, status: :ok
  end

  def create
    user = User.find_by(token: params[:token])
    sub_item = user.subscription_items.new(content: params[:content], type: params[:type])
    sub_item.save!
    render json: 'success!', status: :created
  rescue => e
    render json: e, status: :internal_server_error
  end
end
