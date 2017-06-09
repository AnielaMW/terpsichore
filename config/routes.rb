Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'

  resources :users do
    resources :profiles
  end
  resources :dances do
    resources :dance_comments, only: [:new, :create]
    resources :dance_directions
  end
  resources :dance_comments, except: [:new, :create]
  resources :dance_levels
  resources :formations
  resources :keys
  resources :meters
  resources :moods
  resources :tempos
  resources :comment_types

  namespace :api do
    resources :dance_comments, only: [:create]
    resources :dances, only: [:create, :update]
    resources :dance_directions, only: [:create, :update]
  end
end
