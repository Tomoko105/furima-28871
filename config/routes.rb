Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'
  #get 'index#index'
  resources :items
end
