Rails.application.routes.draw do
  devise_for :users

  root "pages#home"
  
  get '/restricted', to: 'pages#restricted', as: 'restricted'
  get '/about',      to: "pages#about"
  get '/buy',        to: "pages#buy"
  get '/sell',       to: "pages#sell"


end
