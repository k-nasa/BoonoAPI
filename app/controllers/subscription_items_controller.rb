class SubscriptionItemsController < ApplicationController
  def create
    user = User.find_by(token: params[:token])
    sub_item = user.subscription_items.new(subscription_items_params)
    sub_item.save!
    render json: 'success!', status: :created
  rescue
    render json: 'failt', status: :internal_server_error
  end

  def subscription_items_params
    params.require(:subscription_item).permit(:content, :type)
  end
end
