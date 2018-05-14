Rails.application.routes.draw do
  resources :users, only: [:new, :create,:show, :index]
  resource :sessions, only: [:create,:new, :destroy]
  resources :bands
  resources :bands do
   resources :albums, only: [:new]
  end
  resources :albums, except: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
