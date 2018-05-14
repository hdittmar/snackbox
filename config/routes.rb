Rails.application.routes.draw do
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  post '/choose_box/', to: 'pages#choose_box', as: 'choose_box'

  resources :items
  resources :boxes
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
