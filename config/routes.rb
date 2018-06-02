Rails.application.routes.draw do
  resource :users, only: %i(create)
end
