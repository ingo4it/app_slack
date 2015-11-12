Rails.application.routes.draw do
  devise_for :users  
  resource :dashboard, :controller => :dashboard do 
    collection do 
      get 'setting'
      get 'connect'
    end
  end
  resources :accounts

  root to: 'dashboard#connect'
  get '/stripe_callback', :to => 'accounts#stripe_callback', :as => :stripe_callback
  
end
