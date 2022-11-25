Rails.application.routes.draw do

  get 'visits/index'
  root to: 'home#index'
  devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations' }  
  
  get 'doctors/search'
  get 'clinics/search'

  get 'home/users'
  get 'home/info'

  get "clinics/:id/appointment", to: "clinics#appointment", as: "appointment" 
  get "users/appointment"
  get "users/doctors"

  resources :home, :users, :visits

  resources :clinics do
    get :export, on: :collection
    post :import, on: :collection
    
  end

  resources :doctors do
    post :import, on: :collection
  end
end
