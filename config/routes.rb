Tiql::Application.routes.draw do
  root to: 'sites#index'

  match '/login' => 'sessions#new', as: 'login', via: 'get'

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :sites
end
