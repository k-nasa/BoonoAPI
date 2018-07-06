class SubscriptionItemsController < ApplicationController
  def index
    user = User.find_by(token: params[:token])
    sub_items = user.subscription_items
    sub_items = sub_items.order(:type, :content)

    # そのままrender jsonするとtypeが消えるので一旦hashにしてrender jsonする
    sub_items = sub_items.map(&:attributes)

    render json: sub_items, status: :ok
  end

  def destroy
    sub_item = SubscriptionItem.find_by(content: params[:content], type: params[:type])
    sub_item.destroy!

    render json: 'success!', status: :ok
  rescue => e
    render json: e, status: :internal_server_error
  end

  def create
    user = User.find_by(token: params[:token])
    sub_item = user.subscription_items.new(content: params[:content], type: params[:type])
    sub_item.save!
    render json: 'success!', status: :ok
  rescue => e
    render json: e, status: :internal_server_error
  end
end
