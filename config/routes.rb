Rails.application.routes.draw do

  namespace :admin do
    resources :projects, only: [:index, :update]
    resources :landing_pages, only: [:index, :update]
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses, only: [ :index, :show ]

  get 'lab', to: 'pages#lab'
  get 'legal', to: 'pages#legal'

  namespace :user do
    resources :projects,      only: [:index, :create, :edit, :update, :destroy]
    resources :landing_pages, only: [:index, :create, :edit, :update, :destroy, :show]
  end

end
