Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users do
    resources :ideas
  end

  resources :admins do
    resources :categories
  end

  resources :categories, only: [:index, :show, :create]
end
