Rails.application.routes.draw do

  namespace :admin do
    resources :projects,      only: [:index, :update]
    resources :landing_pages, only: [:index, :update]
    resources :surveys,       only: [:index, :new, :create, :update, :edit, :destroy]

  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses, only: [ :index, :show ]

  namespace :user do
    resources :projects,      only: [:index, :create, :edit, :update, :destroy]
    resources :landing_pages, only: [:index, :create, :edit, :update, :destroy, :show]
    resources :surveys,       only: [:index, :show, :match, :note]
  end

  post 'match' => 'user/surveys#match', as: :survey_match
  get 'note' => 'user/surveys#note', as: :survey_note


end
