Rails.application.routes.draw do
  devise_for :users
  root to: 'movies#index'
  resources :movies, only: [:index, :new, :create, :show, :edit, :update] do 
    resources :evaluations, only: [:new, :show, :create, :update]
    resources :favorites, only: [:create, :destroy, :index]
    collection do
      get 'search'
    end
    
  end
  resources :tweets, only: [:index, :new, :create, :edit, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :update]
  get '/mypage' => 'users#mypage'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end
