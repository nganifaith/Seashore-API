Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :beaches

  scope '/favorites' do
    put '/set', to: 'favorites#set_favorite'
    delete '/delete', to: 'favorites#destroy_favorite'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope '/auth' do
    post '/signin', to: 'user_token#create'
    post '/signup', to: 'user#create'
    get '/me', to: 'user#index'
  end
end

