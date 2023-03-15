Rails.application.routes.draw do
  resources :categories
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "mainpages#index"
  # root "articles#index"
  resources :cupons
end
