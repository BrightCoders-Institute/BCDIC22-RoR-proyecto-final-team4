Rails.application.routes.draw do
  resources :categories
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  delete '/logout', to: 'sessions#destroy'


  # Defines the root path route ("/")
  root "mainpages#index", via: [:get,:post]
  # root "articles#index"
 
  resources :cupons do
    member do
      post 'increment_punctuation', to: 'cupons#update'
      post 'decrement_punctuation', to: 'cupons#update'
    end
  end
  
end
