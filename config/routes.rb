Rails.application.routes.draw do

  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  } 
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root to: "home#index"
  resources :users
  resources :recipes
  

  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
 
end
