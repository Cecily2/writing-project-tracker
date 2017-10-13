Rails.application.routes.draw do
  resources :comments
  resources :progress_updates, :path => 'updates'
  resources :projects


  
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

 resources :users, only: [:show, :index] 
  
  root "application#index"

  
end
