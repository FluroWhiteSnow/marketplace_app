Rails.application.routes.draw do
  
  get "/listings", to: "listings#index", as: "listings"
  post "/listings", to: "listings#create"
  get "/listings/new", to: "listings#new", as: "new_listing"
  get "/listings/:id", to: "listings#show", as: "listing"
  put "/listings/:id", to: "listings#update"
  patch "/listings/:id", to: "listings#update"
  delete "/listings/:id", to: "listings#destroy"
  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"
  
  devise_for :users

  root "pages#home", as: "root"
  
  get '/restricted', to: 'pages#restricted', as: 'restricted'
  get '/about',      to: "pages#about"
  get '/buy',        to: "pages#buy"
  get '/sell',       to: "pages#sell"

end
