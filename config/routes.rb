Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :services, except: :delete do
    resources :bookings
  end
  resources :bookings, only: [:index, :edit, :update,]
  # resources :users, only: [:new]

end
