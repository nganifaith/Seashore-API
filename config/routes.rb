Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :beaches

  resources :favorites, only: [:create, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
     resources :user_token, only: [:create]
    resources :user, only: [:index, :create]
     
  
end

