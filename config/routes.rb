Rails.application.routes.draw do
  resources :attendances
  resources :events
  #resources :users, only: [:new, :create]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'attend/:id', to: 'events#attend', as: 'attendy'
   get 'create_attendance', to: 'attendances#create'
   get 'welcome', to: 'sessions#welcome'
   get 'authorized', to: 'sessions#page_requires_login'
   get 'attend', to: 'sessions#attend'
  resources :users
  resources :sessions
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
