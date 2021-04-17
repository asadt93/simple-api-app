# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :users
    post 'user_token' => 'user_token#create', as: :user_token
    resources :courses
    resources :categories
    resources :verticals
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
