class SubscriptionItemsController < ApplicationController
  def create
    sub_item = SubscriptionItem.new(subscription_items_params)
    sub_item.save!
    render json: 'success!', status: :created
  rescue
    render json: 'failt', status: :internal_server_error
  end

  def subscription_items_params
    params.require(:subscription_item).permit(:content, :type)
  end
end
