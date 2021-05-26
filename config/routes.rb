Rails.application.routes.draw do
  
  resources :conversations do 
    resources :messages
  end

  resources :listings

  # get "/listings", to: "listings#index", as: "listings"
  # post "/listings", to: "listings#create"
  # get "/listings/new", to: "listings#new", as: "new_listing"
  # get "/listings/:id", to: "listings#show", as: "listing"
  # put "/listings/:id", to: "listings#update"
  # patch "/listings/:id", to: "listings#update"
  # delete "/listings/:id", to: "listings#destroy"
  # get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"
  # put "/listing/:id", to: "listings#update"

  devise_for :users

  root "pages#home", as: "root"
  
  get '/purchases/success', to: 'purchases#success'
  post '/purchases/webhook', to: 'purchases#webhook'


  get '/restricted', to: 'pages#restricted', as: 'restricted'
  get '/about',      to: "pages#about"
  get '/buy',        to: "pages#buy"
  get '/sell',       to: "pages#sell"

end
