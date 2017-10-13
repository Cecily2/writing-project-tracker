Rails.application.routes.draw do
  resources :comments
  resources :projects do
    resources :progress_updates, :path => 'updates'
  end

  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

 resources :users, only: [:show, :index] 
  
  root "application#index"

  
end
