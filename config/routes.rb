Rails.application.routes.draw do

  get 'character_force_power_upgrades/edit'
  get 'character_force_power_upgrades/update'
  get 'character_spec_talents/edit'
  devise_for :users
  root 'pages#index'
  get 'pages/index'

  resources :characters do
    resources :character_skills, only: [:new, :create, :edit, :update, :destroy]
    resources :character_careers, only: [:new, :create, :edit, :update, :destroy]
    resources :character_specializations, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :character_talents, only: [:new, :create, :edit, :update, :destroy, :index]
    resources :character_spec_talents, only: [:edit, :update]
    resources :character_force_powers, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :character_force_power_upgrades, only: [:edit, :update]
  end
end
