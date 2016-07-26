Rails.application.routes.draw do
  resources :stores, only: [:index, :show]
  
end
