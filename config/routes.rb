Rails.application.routes.draw do
  root 'site#index'
  resources :movies
  resources :actors
end
