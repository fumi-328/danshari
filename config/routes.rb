# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'omniauth_callbacks'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'static_pages#top'
  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  post '/webhook', to: 'line_bot#callback'

  resources :posts, only: %i[index new edit create destroy update show] do
    resources :comments, only: %i[create edit destroy], shallow: true

    member do
      patch :change_discard_flag
    end
  end

  resources :praises, only: %i[create destroy]
  resource :mypage, only: %i[show]
end
