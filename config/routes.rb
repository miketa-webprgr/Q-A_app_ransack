Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i[index destroy]
  end
  namespace :admin do
    resources :questions, only: %i[index destroy]
  end
  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, except: :destroy
  root to: 'questions#index'
  resources :questions do
    resources :answers, only: [:create]
  end
end
