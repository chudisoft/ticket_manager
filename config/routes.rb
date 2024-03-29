# frozen_string_literal: true

Rails.application.routes.draw do
  # root 'home#index'
  root 'events#index_Unauth'
  devise_for :users, controllers: { registrations: 'registrations' }

  # resources :speaker_events
  resources :speakers
  # resources :events #, only: [:new, :edit, :create, :destroy]
  # resources :bookings #, only: [:new, :edit, :create, :destroy]
  resources :events do
    resources :speakers, controller: 'speaker_events'
    resources :bookings do
      resources :payments
    end
    resources :payments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
