Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users  
  
  get 'doctors/search'
  get 'clinics/search'

  get 'home/users'
  get 'home/info'

  resources :doctors, :clinics, :home, :users
end