Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  resources :users
  resources :recipes

  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
 
end
