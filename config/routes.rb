Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'
  #resources :items
  #resources :consumers

  resources :items do
    resources :consumers, only: [:index, :new, :create]
  end
end

