Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    collection do 
      get 'search'
    end
    resources :orders, only: [:index, :create]
    resources :comments, only: [:new, :create]
  end
end
