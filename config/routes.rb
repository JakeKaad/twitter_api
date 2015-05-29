Rails.application.routes.draw do
  root 'static_pages#home'
  get '/tweets', to: 'static_pages#tweets'
  resources :tweets, only: [:new]
end
