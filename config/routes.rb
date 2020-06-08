Rails.application.routes.draw do
  
  root to: "home#index"

  devise_for :users, :controllers => {
    sessions: 'users/sessions'   
  } 
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  
  resources :users
  resources :recipes
  

  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
 
end
