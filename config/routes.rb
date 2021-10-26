Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :beaches

  resources :favorites, only: [:create, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    post '/signin', to: 'user_token#create'
    post '/signup', to: 'user#create'
    get '/me', to: 'user#index'
  
end

