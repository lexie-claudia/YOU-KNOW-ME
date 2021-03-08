Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :categories, except: [:show] do
    resources :preferences, except: [:show]
  end
  resources :restaurants, only: [:index, :new, :create] do
    resources :bookings, only: [:new, :create, :index]
  end

end
