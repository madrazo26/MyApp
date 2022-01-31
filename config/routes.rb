# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]

  resources :waybills do
    resources :answers, except: %i[new show]
  end

  namespace :admin do
    resources :users, only: %i[index create]
  end

  root 'pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
