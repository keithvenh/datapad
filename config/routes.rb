Rails.application.routes.draw do

  devise_for :users
  root 'pages#index'
  get 'pages/index'

  resources :characters do
    resources :character_skills, only: [:new, :create, :edit, :update, :destroy]
    resources :character_careers, only: [:new, :create, :edit, :update, :destroy]
    resources :character_specializations, only: [:new, :create, :edit, :update, :destroy]
  end
end
