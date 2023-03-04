Rails.application.routes.draw do
  get 'account_details/show'
  get 'jobs', to: 'jobs#show'
  get 'jobs/new'
  get 'pages/home'
  get 'about', to: 'pages#about'
  root 'pages#home'
  get 'account_details', to: 'account_details#show'


 
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
  resources :jobs, only: [:show, :new, :create, :edit, :update, :destroy] do
    member do
      get 'show_details'
    end
  end
  resources :users do
    get 'account_details', on: :member
    patch 'change_password', on: :member
  end
  


end
