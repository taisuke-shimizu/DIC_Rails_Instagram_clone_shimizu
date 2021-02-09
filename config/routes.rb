Rails.application.routes.draw do
  root to: 'user#new'
  resources :users, only: [:new, :create, :show, :edit]
end
