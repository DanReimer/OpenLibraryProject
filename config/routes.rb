Rails.application.routes.draw do
  get 'about', to: 'about#index'

  get 'home/index'

  resources :authors, only: [:index, :show]
  resources :books, only: [:index, :show]

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
