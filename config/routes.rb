Myflix::Application.routes.draw do
  root to: 'videos#index'

  get 'ui(/:action)', controller: 'ui'
  get '/home', to: 'categories#index'

  resources :videos, only: [:show]
end

#just a change to update mod2a for pull request
