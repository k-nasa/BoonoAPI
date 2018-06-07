Rails.application.routes.draw do
  resource :users, only: %i(create)
  resource :subscription_items, only: %i(create)
end
