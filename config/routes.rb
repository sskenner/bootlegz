Myflix::Application.routes.draw do
  root to: 'videos#index'

  get 'ui(/:action)', controller: 'ui'
  get '/home', to: 'categories#index'

  resources :videos, only: [:show]
end
