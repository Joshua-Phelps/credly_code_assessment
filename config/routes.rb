Rails.application.routes.draw do
  get '/', to: 'characters#index'
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create' 
  delete '/logout', to: 'sessions#destroy'

  resources :characters do
    resources :badges
  end 
  resources :users
  # resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
