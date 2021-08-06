Rails.application.routes.draw do

  devise_for :users
  root 'pages#index'
  get 'pages/index'
  get 'admin', to: 'pages#admin'


  resources :characters do
    resources :character_skills, only: [:new, :create, :edit, :update, :destroy]
    resources :character_careers, only: [:new, :create, :edit, :update, :destroy]
    resources :character_specializations, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :character_talents, only: [:new, :create, :edit, :update, :destroy, :index]
    resources :character_spec_talents, only: [:edit, :update]
    resources :character_force_powers, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :character_force_power_upgrades, only: [:edit, :update]
  end

  resources :specializations, only: [:edit, :update, :detroy, :show] do 
    resources :specialization_talents, only: [:edit, :update, :destroy]
    resources :specialization_skills, only: [:edit, :update, :destroy]
  end

  resources :force_powers, only: [:edit, :update, :destroy, :show] do
    resources :force_power_upgrades, only: [:edit, :update, :destroy]
  end

  resources :careers, only: [:edit, :update, :destroy, :show] do
    resources :career_skills, only: [:edit, :update, :destroy]
  end

  resources :talents, only: [:edit, :update, :destroy]
  resources :books, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :skills, only: [:index, :edit, :update, :destroy]


end
