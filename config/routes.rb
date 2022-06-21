Rails.application.routes.draw do
  resources :characters, only: [:index, :show]
  resources :monsters
  resources :teams
  get '/hello', to: 'application#hello_world'

  get '*path',
      to: 'fallback#index',
      constraints: ->(req) { !req.xhr? && req.format.html? }
end
