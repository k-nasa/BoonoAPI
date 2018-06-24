Rails.application.routes.draw do
  resource :users, only: %i(create update)
  resource :subscription_items, only: %i(create destroy)

  get 'subscription_items/:token' => 'subscription_items#index'
  delete 'subscription_items/:id' => 'subscription_items#destroy'

  get 'notify_books/:token' => 'notify_books#index'
end
