Rails.application.routes.draw do
  resources :event_attendances
  resources :events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get('/signin', to: 'auth#signin')
  post('/signin', to: 'auth#authenticate')
end
