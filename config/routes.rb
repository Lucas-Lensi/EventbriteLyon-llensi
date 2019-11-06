Rails.application.routes.draw do
  root 'static_pages#index'
  get 'static_pages/secret'
  resources :event do
    resources :attendance, only: [:index, :create]
  end
  resources :user
  resources :charges, only: [:new, :create]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
