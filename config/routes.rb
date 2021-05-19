Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

  get 'pages/home'
  get 'pages/restricted'
  get 'pages/about'
  get 'pages/buy'
  get 'pages/sell'

end
