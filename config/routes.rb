Rails.application.routes.draw do
  resources :comments
  resources :projects do
    resources :progress_updates, :path => 'updates'
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

 resources :users, only: [:show, :index] 

 get '/users/:id/updates', to: 'progress_updates#user_index'

  root "application#index"
  
  
end
