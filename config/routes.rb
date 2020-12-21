Rails.application.routes.draw do
  devise_for :users
  root to: 'movies#index'
  resources :movies, only: [:index, :new, :create, :show, :edit, :update] do 
    resources :evaluations, only: [:new, :show, :create, :update]
  end
  resources :tweets, only: [:index, :new, :create, :edit, :destroy]
end
