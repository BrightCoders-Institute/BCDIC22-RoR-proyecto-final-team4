Rails.application.routes.draw do
  resources :categories
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  delete '/logout', to: 'sessions#destroy'

  delete 'users/:id', to: 'mainpages#destroy', as: 'user_delete'

  # Defines the root path route ("/")
  root "mainpages#index", via: [:get,:post]
  resources :mainpages, only: [:update]
  resources :cupons do
    member do
      post 'increment_punctuation', to: 'cupons#update'
      post 'decrement_punctuation', to: 'cupons#update'
    end
  end
end
