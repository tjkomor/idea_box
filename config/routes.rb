Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users do
    resources :ideas
  end
end
