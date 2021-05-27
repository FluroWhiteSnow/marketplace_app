Rails.application.routes.draw do
  #Allows messages routes from conversations routes

  resources :conversations do 
    resources :messages
  end

  resources :listings

  devise_for :users

  root "pages#home", as: "root"
  
  get '/purchases/success', to: 'purchases#success'
  post '/purchases/webhook', to: 'purchases#webhook'

  get '/restricted', to: 'pages#restricted', as: 'restricted'
  get '/about',      to: "pages#about"
  get '/buy',        to: "pages#buy"
  get '/sell',       to: "pages#sell"

end
